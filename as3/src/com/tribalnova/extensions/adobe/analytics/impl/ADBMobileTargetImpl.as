package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileTarget;
	import com.tribalnova.extensions.adobe.analytics.data.ADBTargetLocationRequest;
	import com.tribalnova.extensions.adobe.analytics.utils.ObjectUtils;
	
	import flash.external.ExtensionContext;
	import flash.utils.Dictionary;
	
	public class ADBMobileTargetImpl implements IADBMobileTarget
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileTargetImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function targetLoadRequest(request:ADBTargetLocationRequest):void
		{
			//var keyList:Array = ObjectUtils.extractKeysFromObj(request);
			//trace(request.name, request.defaultContent, request.parameters, request.parametersKeys);
			_extContext.call( "targetLoadRequest", {name:request.name, defaultContent:request.defaultContent, parameters:request.parameters, parametersKeys:request.parametersKeys}); 
		}
		
		public function targetCreateRequestWithName(name:String, defaultContent:String, parameters:Dictionary):ADBTargetLocationRequest
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(parameters);
			trace("Before : ", name, defaultContent, parameters, keyList);
			var obj:Object = _extContext.call( "targetCreateRequestWithName", name, defaultContent, parameters, keyList);
			var request:ADBTargetLocationRequest = new ADBTargetLocationRequest(obj);
			trace("After : ", request.name, request.defaultContent, request.parameters, request.parametersKeys);
			return request;
		}
		
		public function targetCreateOrderConfirmRequestWithName(name:String, orderId:String, orderTotal:String, productPurchasedId:String, parameters:Dictionary):ADBTargetLocationRequest
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(parameters);
			var obj:Object = _extContext.call( "targetCreateOrderConfirmRequestWithName", name, orderId, orderTotal, productPurchasedId, parameters, keyList);
			var request:ADBTargetLocationRequest = new ADBTargetLocationRequest(obj);
			return request;
		}
		
		public function targetClearCookies():void
		{
			_extContext.call( "targetClearCookies"); 
		}
	}
}