package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileAudience;
	import com.tribalnova.extensions.adobe.analytics.ObjectUtils;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileAudienceImpl implements IADBMobileAudience
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileAudienceImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function audienceVisitorProfile():Object
		{
			return _extContext.call( "audienceVisitorProfile" );
		}
		
		public function get audienceDpid():String
		{
			return _extContext.call( "audienceDpid" ) as String;
		}
		
		public function get audienceDpuuid():String
		{
			return _extContext.call( "audienceDpuuid" ) as String;
		}
		
		public function setAudienceDpid(dpid:String, dpuuid:String):void
		{
			_extContext.call( "setAudienceDpid", dpid, dpuuid);
		}
		
		public function audienceSignalWithData(context:Object):void
		{
			var keyList:Array = ObjectUtils.extractKeysFromObj(context);
			_extContext.call( "audienceSignalWithData", context, keyList);
		}
		
		public function audienceReset():void
		{
			_extContext.call( "audienceReset");
		}
	}
}