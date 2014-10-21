package com.tribalnova.extensions.adobe.analytics
{
	public interface IADBMobileAnalytics
	{
		function trackState(state:String, context:Object):void;
		
		function trackAction(action:String, context:Object):void;
		
		function trackActionFromBackground(action:String, context:Object):void;
		
		function trackLifetimeValueIncrease(amount:Number, context:Object):void;
		
		function trackTimedActionStart(action:String, context:Object):void;
		function trackTimedActionUpdate(action:String, context:Object):void;
		function trackTimedActionEnd(action:String, context:Object):void;
		
		function trackingTimedActionExists(action:String):Boolean;
		
		function trackingSendQueuedHits():void;
		
		function trackingClearQueue():void;
		
		function get trackingQueueSize():Number;
	}
}