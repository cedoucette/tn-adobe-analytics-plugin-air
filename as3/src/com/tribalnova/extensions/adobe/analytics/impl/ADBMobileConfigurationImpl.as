package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileConfiguration;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileConfigurationImpl implements IADBMobileConfiguration
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileConfigurationImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
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
		
		public function get lifetimeValue():Number
		{
			return _extContext.call( "lifetimeValue" ) as Number;
		}
		
		public function get userIdentifier():String
		{
			return _extContext.call( "userIdentifier" ) as String;
		}
		
		public function set userIdentifier(value:String):void
		{
			_extContext.call( "setUserIdentifier", value ) as String;
		}
		
		public function get debugLogging():Boolean
		{
			return _extContext.call( "debugLogging" ) as Boolean;
		}
		
		public function set debugLogging(value:Boolean):void
		{
			_extContext.call( "setDebugLogging", value );
		}
		
		public function collectLifecycleData():void
		{
			_extContext.call( "collectLifecycleData" );
		}
		
		public function keepLifecycleSessionAlive():void
		{
			_extContext.call( "keepLifecycleSessionAlive" );
		}
		
		public function get ADBMOBILE_PPRIVACYSTATUS_OPTIN():uint
		{
			return 1;
		}
		public function get ADBMOBILE_PPRIVACYSTATUS_OPTOUT():uint
		{
			return 2;
		}
		public function get ADBMOBILE_PPRIVACYSTATUS_UNKNOWN():uint
		{
			return 3;
		}
	}
}