package com.tribalnova.extensions.adobe.analytics
{
	public interface IADBMobileConfiguration
	{
		function get ADBMOBILE_PPRIVACYSTATUS_OPTIN():uint;
		function get ADBMOBILE_PPRIVACYSTATUS_OPTOUT():uint;
		function get ADBMOBILE_PPRIVACYSTATUS_UNKNOWN():uint;
		
		function get version():String;
		
		function get privacyStatus():Number;
		function set privacyStatus(value:Number):void;
		
		function get lifetimeValue():Number;
		
		function get userIdentifier():String;
		function set userIdentifier(value:String):void;
		
		function get debugLogging():Boolean;
		function set debugLogging(value:Boolean):void;
		
		function collectLifecycleData():void;
		function keepLifecycleSessionAlive():void;
	}
}