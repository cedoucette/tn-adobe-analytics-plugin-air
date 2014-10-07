package com.tribalnova.extensions.adobe.analytics
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	
	public class AdobeMobileAnalytics extends EventDispatcher
	{
		private static var _instance:AdobeMobileAnalytics;
		
		public function AdobeMobileAnalytics( enforcer:SingletonEnforcer )
		{
			super();
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
		
		private function onStatus( e:StatusEvent ):void {}
		
		private function init():void {}
		
		public function helloWorld():String
		{
			return "Hello world";
		}
	}
}

class SingletonEnforcer {}