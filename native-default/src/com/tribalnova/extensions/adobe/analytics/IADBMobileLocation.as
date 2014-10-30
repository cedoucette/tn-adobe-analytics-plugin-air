package com.tribalnova.extensions.adobe.analytics
{
	public interface IADBMobileLocation
	{
		function trackLocation(context:Object):void;
		
		function trackBeacon(beaconID:String):void;
		function trackingClearCurrentBeacon():void;
	}
}