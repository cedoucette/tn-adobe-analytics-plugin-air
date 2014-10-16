package com.tribalnova.extensions.adobe.analytics
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.utils.Dictionary;
	
	public class AdobeMobileAnalytics extends EventDispatcher
	{
		private static var _instance:AdobeMobileAnalytics;
		
		private var _extContext:ExtensionContext;
		
		public const ADBMOBILE_PPRIVACYSTATUS_OPTIN:uint = 1;
		public const ADBMOBILE_PPRIVACYSTATUS_OPTOUT:uint = 2;
		public const ADBMOBILE_PPRIVACYSTATUS_UNKNOWN:uint = 3;
		
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
			// _extContext.call( "init" );
		}
		
		public function helloWorld():String
		{
			return _extContext.call( "helloWorld" ) as String;
		}
		
		public function get version():String
		{
			return _extContext.call( "version" ) as String;
		}
		
		public function get privacyStatus():Number
		{
			return _extContext.call( "privacyStatus" ) as Number;
		}
		
		public function set privacyStatus(value:Number):void
		{
			if(value != ADBMOBILE_PPRIVACYSTATUS_OPTIN && value != ADBMOBILE_PPRIVACYSTATUS_OPTOUT && value != ADBMOBILE_PPRIVACYSTATUS_UNKNOWN)
				throw "privacyStatus value must be 1, 2 or 3 (OptIn, OptOut, Unknown)";
			
			_extContext.call( "setPrivacyStatus", value );
		}
		
		public function trackState(trackState:String, contextData:Object):void
		{
			var keyList:Array = extractKeysFromObj(contextData);
			trace("AS3 keyList: "+keyList);
			_extContext.call( "trackState", trackState, contextData, keyList); 	
		}
		
		
		private function extractKeysFromObj(dict:Object):Array
		{
			var keyList:Array = [];
			for(var key:String in dict)
			{
				keyList.push(key);
			}
			return keyList;
		}
		
	}
}

class SingletonEnforcer {}