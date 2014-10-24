package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileTarget;
	import com.tribalnova.extensions.adobe.analytics.ObjectUtils;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileTargetImpl implements IADBMobileTarget
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileTargetImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function targetLoadRequest(request:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(request);
			_extContext.call( "targetLoadRequest", request, keyList); 
		}
		
		public function targetCreateRequestWithName(name:String, defaultContent:String, parameters:Object):Object
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(parameters);
			return _extContext.call( "targetCreateRequestWithName", name, defaultContent, parameters, keyList);
		}
		
		public function targetCreateOrderConfirmRequestWithName(name:String, orderId:String, orderTotal:String, productPurchasedId:String, parameters:Object):Object
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(parameters);
			return _extContext.call( "targetCreateOrderConfirmRequestWithName", name, orderId, orderTotal, productPurchasedId, parameters, keyList);
		}
		
		public function targetClearCookies():void
		{
			_extContext.call( "targetClearCookies"); 
		}
	}
}