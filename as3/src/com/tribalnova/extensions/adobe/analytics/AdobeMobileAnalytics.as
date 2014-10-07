package com.tribalnova.extensions.adobe.analytics
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class AdobeMobileAnalytics extends EventDispatcher
	{
		private static var _instance:AdobeMobileAnalytics;
		
		private var _extContext:ExtensionContext;
		
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
			_extContext.call( "init" );
		}
		
		public function helloWorld():String
		{
			return _extContext.call( "helloWorld" ) as String;
		}
	}
}

class SingletonEnforcer {}