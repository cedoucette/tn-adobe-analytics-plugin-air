package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileTarget;
	import com.tribalnova.extensions.adobe.analytics.ObjectUtils;
	import com.tribalnova.extensions.adobe.analytics.data.ADBTargetLocationRequest;
	
	import flash.external.ExtensionContext;
	import flash.utils.Dictionary;
	
	public class ADBMobileTargetImpl implements IADBMobileTarget
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileTargetImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function targetCreateRequestWithName(name:String, defaultContent:String, parameters:Dictionary):ADBTargetLocationRequest
		{
			//var keyList:Array = ObjectUtils.extractKeysFromObj(request);
			//_extContext.call( "targetLoadRequest", request, keyList); 
			return new ADBTargetLocationRequest({name:name, defaultContent:defaultContent, parameters:parameters});
		}
		
		public function targetCreateOrderConfirmRequestWithName(name:String, orderId:String, orderTotal:String, productPurchasedId:String, parameters:Dictionary):ADBTargetLocationRequest
		{
			//var keyList:Array = ObjectUtils.extractKeysFromObj(parameters);
			//return _extContext.call( "targetCreateRequestWithName", name, defaultContent, parameters, keyList);
			return new ADBTargetLocationRequest({name:name, orderId:orderId, orderTotal:orderTotal, productPurchasedId:productPurchasedId, parameters:parameters});
		}
		
		public function targetLoadRequest(request:ADBTargetLocationRequest):void
		{
			//var keyList:Array = ObjectUtils.extractKeysFromObj(parameters);
			//_extContext.call( "targetLoadRequest", request, keyList);
		}
		
		public function targetClearCookies():void
		{
			//_extContext.call( "targetClearCookies"); 
		}
	}
}