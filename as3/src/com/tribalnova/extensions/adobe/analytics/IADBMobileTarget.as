package com.tribalnova.extensions.adobe.analytics
{
	public interface IADBMobileTarget
	{
		function targetLoadRequest(request:Object):void;
		function targetCreateRequestWithName(name:String, defaultContent:String, parameters:Object):Object;
		function targetCreateOrderConfirmRequestWithName(name:String, orderId:String, orderTotal:String, productPurchasedId:String, parameters:Object):Object;
		function targetClearCookies():void;
	}
}