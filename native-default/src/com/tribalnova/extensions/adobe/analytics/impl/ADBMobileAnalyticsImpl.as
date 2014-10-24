package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileAnalytics;
	import com.tribalnova.extensions.adobe.analytics.ObjectUtils;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileAnalyticsImpl implements IADBMobileAnalytics
	{
		
		private var _extContext:ExtensionContext;
		
		public function ADBMobileAnalyticsImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function trackState(trackState:String, context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			//_extContext.call( "trackState", trackState, context, keyList);
		}
		
		public function trackAction(trackAction:String, context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
		
			//_extContext.call( "trackAction", trackAction, context, keyList);
		}
		
		public function trackActionFromBackground(action:String, context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			//_extContext.call( "trackActionFromBackground", trackAction, context, keyList);
		}
		
		public function trackLifetimeValueIncrease(amount:Number, context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			//_extContext.call( "trackLifetimeValueIncrease", amount, context, keyList);
		}
		
		public function trackTimedActionStart(action:String, context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			//_extContext.call( "trackTimedActionStart", action, context, keyList);
		}
		
		public function trackTimedActionUpdate(action:String, context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			//_extContext.call( "trackTimedActionUpdate", action, context, keyList);
		}
		
		public function trackTimedActionEnd(action:String, context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			//_extContext.call( "trackTimedActionEnd", action, context, keyList);
		}
		
		public function trackingTimedActionExists(action:String):Boolean
		{
			return (Math.random() * 100 > 50);
		}
		
		public function trackingSendQueuedHits():void
		{
			//_extContext.call( "trackingSendQueuedHits");
		}
		
		public function trackingClearQueue():void
		{
			//_extContext.call( "trackingClearQueue");
		}
		
		public function get trackingQueueSize():Number
		{
			return Math.random() * 5;
			//return _extContext.call( "trackingGetQueueSize") as Number;
		}
		
		public function get trackingIdentifier():String
		{
			return "trackingIdentifier";
			//return _extContext.call( "trackingIdentifier" ) as String;
		}
	}
}