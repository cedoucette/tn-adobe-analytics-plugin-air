package com.tribalnova.extensions.adobe.analytics
{
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileAnalyticsImpl;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileConfigurationImpl;
	import com.tribalnova.extensions.adobe.analytics.impl.ADBMobileMediaAnalyticsImpl;
	
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
		
		public function AdobeMobileAnalytics( enforcer:SingletonEnforcer )
		{
			super();
			
			// Second parameter is optional and supplies context to matove code
			_extContext = ExtensionContext.createExtensionContext("com.tribalnova.extensions.adobe.analytics", "" );
			
			if ( _extContext == null )
				throw new Error( "Extension is not supported on this platform." );
			
			_extContext.addEventListener( StatusEvent.STATUS, onStatus );
		}

		public static function get instance():AdobeMobileAnalytics
		{
			if ( _instance == null )
			{
				_instance = new AdobeMobileAnalytics( new SingletonEnforcer() );
				_instance.init();
			}
			
			return _instance;
		}
		
		
		
		private function onStatus( e:StatusEvent ):void
		{
			// Do nothing yet
		}
		
		private function init():void
		{
			_configuration = new ADBMobileConfigurationImpl(_extContext);
			_analytics = new ADBMobileAnalyticsImpl(_extContext);
			_mediaAnalytics = new ADBMobileMediaAnalyticsImpl(_extContext);
		}
		
		public function get mediaAnalytics():IADBMobileMediaAnalytics
		{
			if(_mediaAnalytics == null);
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
			
			return _configuration;
		}
		
		public function helloWorld():String
		{
			return _extContext.call( "helloWorld" ) as String;
		}
	}
}

class SingletonEnforcer {}