package com.tribalnova.extensions.adobe.analytics
{
	public interface IADBMobileAudience
	{
		/*
		FREObject audienceVisitorProfile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
		FREObject audienceDpid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
		FREObject audienceDpuuid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
		FREObject audienceSetDpid(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
		FREObject audienceSignalWithData(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
		FREObject audienceReset(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
		*/
		
		function audienceVisitorProfile():Object;
		function get audienceDpid():String;
		function get audienceDpuuid():String;
		function setAudienceDpid(dpid:String, dpuuid:String):void;
		function audienceSignalWithData(context:Object):void;
		function audienceReset():void
		
	}
}