package com.tribalnova.extensions.adobe.analytics
{
	import com.tribalnova.extensions.adobe.analytics.events.AdobeMobileAnalyticsEvent;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileAnalyticsImpl;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileAudienceImpl;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileConfigurationImpl;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileLocationImpl;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileMediaAnalyticsImpl;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileTargetImpl;
	
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class AdobeMobileAnalytics extends EventDispatcher
	{
		private static var _instance:AdobeMobileAnalytics;
		
		private var _extContext:ExtensionContext;
		
		private var _configuration:IADBMobileConfiguration;
		private var _analytics:IADBMobileAnalytics;
		private var _mediaAnalytics:IADBMobileMediaAnalytics;
		
		private var _location:IADBMobileLocation;
		private var _target:IADBMobileTarget;
		private var _audience:IADBMobileAudience;
		
		private static var _isSupported:Boolean = true;
		
		
		public function AdobeMobileAnalytics( enforcer:SingletonEnforcer )
		{
			super();
			
			// Second parameter is optional and supplies context to native code
			_extContext = ExtensionContext.createExtensionContext("com.tribalnova.extensions.adobe.analytics", "" );
			
			if ( _extContext == null ) 
			{
				_isSupported = false;
				//throw new Error( "Extension is not supported on this platform." );
			}
			_extContext.addEventListener( StatusEvent.STATUS, onStatus );
				
			_isSupported = true;
		}

		private function init():void
		{
			_configuration = new ADBMobileConfigurationImpl(_extContext);
			_analytics = new ADBMobileAnalyticsImpl(_extContext);
			_mediaAnalytics = new ADBMobileMediaAnalyticsImpl(_extContext);
			_location = new ADBMobileLocationImpl(_extContext);
			_target = new ADBMobileTargetImpl(_extContext);
			_audience = new ADBMobileAudienceImpl(_extContext);
			trace("init");
		}
		
		
		/** HANDLERS **/
		
		private function onStatus( e:StatusEvent ):void
		{
			trace("on status");
			
			if(e.code == AdobeMobileAnalyticsEvent.ANE_IS_READY)
				dispatchEvent(new AdobeMobileAnalyticsEvent(AdobeMobileAnalyticsEvent.ANE_IS_READY));
		}
		
		
		/** HELPERS **/
		
		public static function helloWorld():String
		{
			// Doesn't work within static method, and will break in AIR apps in any case
			// return _extContext.call( "helloWorld" ) as String;
			
			return "Hello world (iOS)";
		}
		
		
		/** GETTERS AND SETTERS **/
		
		public static function get instance():AdobeMobileAnalytics
		{
			if ( _instance == null )
			{
				_instance = new AdobeMobileAnalytics( new SingletonEnforcer() );
				_instance.init();
			}
			
			return _instance;
		}
		
		public function get mediaAnalytics():IADBMobileMediaAnalytics
		{
			if(_mediaAnalytics == null)
				_mediaAnalytics = new ADBMobileMediaAnalyticsImpl(_extContext);	
			
			return _mediaAnalytics;
		}
		
		public function get analytics():IADBMobileAnalytics
		{
			if(_analytics == null)
				_analytics = new ADBMobileAnalyticsImpl(_extContext);
			
			return _analytics;
		}
		
		public function get configuration():IADBMobileConfiguration
		{
			if(_configuration == null)
				_configuration = new ADBMobileConfigurationImpl(_extContext);
			
			trace("get configuration");
			return _configuration;
		}
		
		public function get location():IADBMobileLocation
		{
			if(_location == null)
				_location = new ADBMobileLocationImpl(_extContext);
			
			trace("ADBMobileLocation methods aren't fully implemented, use at your own risk");
			
			return _location;
		}
		
		public function get target():IADBMobileTarget
		{
			if(_target)
				_target = new ADBMobileTargetImpl(_extContext);
			
			return _target;
		}
		
		public function get audience():IADBMobileAudience
		{
			if(_audience)
				_audience = new ADBMobileAudienceImpl(_extContext);
			
			return _audience;
		}
		
		public static function get isSupported():Boolean
		{
			return _isSupported;
		}

	}
}

class SingletonEnforcer {}