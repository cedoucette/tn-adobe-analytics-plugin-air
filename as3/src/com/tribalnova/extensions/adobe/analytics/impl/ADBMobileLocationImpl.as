package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileLocation;
	import com.tribalnova.extensions.adobe.analytics.ObjectUtils;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileLocationImpl implements IADBMobileLocation
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileLocationImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function trackLocation(context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			_extContext.call( "trackLocation", context, keyList );
		}
		
		public function trackBeacon():void
		{
			_extContext.call( "trackBeacon");
		}
		
		public function trackingClearCurrentBeacon():void
		{
			_extContext.call( "trackingClearCurrentBeacon");
		}
	}
}