package com.tribalnova.extensions.adobe.analytics.events
{
	import flash.events.Event;
	
	public class AdobeMobileAnalyticsEvent extends Event
	{
		public static const ANE_IS_READY:String = "ready";
		
		public function AdobeMobileAnalyticsEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
		}
	}
}