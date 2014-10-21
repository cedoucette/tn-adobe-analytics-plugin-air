package com.tribalnova.extensions.adobe.analytics
{
	public interface IADBMobileMediaAnalytics
	{
		function mediaCreateSettingsWithName(mediaName:String, mediaLength:Number, playerName:String, playerID:String):Object;
		
		function mediaAdCreateSettingsWithName(adName:String, adLength:Number, playerName:String, parentName:String, podName:String, parentPosition:Number, CPM:String):Object;
		
		function mediaOpenWithSettings(mediaDescriptor:Object):void; //see ADBMediaSettings in native
		
		function mediaPlay(name:String, position:Number):void;
		
		function mediaStop(name:String, position:Number):void;
		
		function mediaComplete(name:String, position:Number):void;
		
		function mediaClose(name:String):void;
		
		function mediaClick(name:String, position:Number):void;
		
		function mediaTrack(state:String, context:Object):void;
	}
}