package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileConfiguration;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileConfigurationImpl implements IADBMobileConfiguration
	{
		private var _extContext:ExtensionContext;
		
		private var _privacyStatus:Number;
		private var _userIdentifier:String;
		private var _debugLogging:Boolean;
		
		public function ADBMobileConfigurationImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function get version():String
		{
			return "0.0.0";
		}
		
		public function get privacyStatus():Number
		{
			return _privacyStatus;
		}
		
		public function set privacyStatus(value:Number):void
		{
			if(value != ADBMOBILE_PPRIVACYSTATUS_OPTIN && value != ADBMOBILE_PPRIVACYSTATUS_OPTOUT && value != ADBMOBILE_PPRIVACYSTATUS_UNKNOWN)
				throw "privacyStatus value must be 1, 2 or 3 (OptIn, OptOut, Unknown)";
			
			_privacyStatus = value;
		}
		
		public function get lifetimeValue():Number
		{
			return 42;
		}
		
		public function get userIdentifier():String
		{
			return _userIdentifier;
		}
		
		public function set userIdentifier(value:String):void
		{
			_userIdentifier = value;
		}
		
		public function get debugLogging():Boolean
		{
			return _debugLogging;
		}
		
		public function set debugLogging(value:Boolean):void
		{
			_debugLogging = value;
		}
		
		public function collectLifecycleData():void
		{
			
		}
		
		public function keepLifecycleSessionAlive():void
		{
			
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