package com.tribalnova.extensions.adobe.analytics
{
	import com.tribalnova.extensions.adobe.analytics.data.ADBTargetLocationRequest;
	
	import flash.utils.Dictionary;

	public interface IADBMobileTarget
	{
		function targetCreateRequestWithName(name:String, defaultContent:String, parameters:Dictionary):ADBTargetLocationRequest;
		function targetCreateOrderConfirmRequestWithName(name:String, orderId:String, orderTotal:String, productPurchasedId:String, parameters:Dictionary):ADBTargetLocationRequest;
		function targetLoadRequest(request:ADBTargetLocationRequest):void;
		function targetClearCookies():void;
	}
}