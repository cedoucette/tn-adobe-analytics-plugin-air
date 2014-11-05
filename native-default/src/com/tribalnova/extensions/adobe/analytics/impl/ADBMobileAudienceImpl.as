package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileAudience;
	import com.tribalnova.extensions.adobe.analytics.utils.ObjectUtils;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileAudienceImpl implements IADBMobileAudience
	{
		private var _extContext:ExtensionContext;
		private var _dpid:String;
		private var _dpuuid:String;
		
		public function ADBMobileAudienceImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function get audienceVisitorProfile():Object
		{
			return {dpid:_dpid, dpuuid:_dpuuid};
		}
		
		public function get audienceDpid():String
		{
			return _dpid;
		}
		
		public function get audienceDpuuid():String
		{
			return _dpuuid;
		}
		
		public function setAudienceDpid(dpid:String, dpuuid:String):void
		{
			_dpid = dpid;
			_dpuuid = dpuuid;
		}
		
		public function audienceSignalWithData(context:Object):void
		{
		}
		
		public function audienceReset():void
		{
		}
	}
}