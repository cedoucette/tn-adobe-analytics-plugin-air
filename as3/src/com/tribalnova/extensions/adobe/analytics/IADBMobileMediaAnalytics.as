package com.tribalnova.extensions.adobe.analytics
{
	import com.tribalnova.extensions.adobe.analytics.data.ADBMediaSettings;

	public interface IADBMobileMediaAnalytics
	{
		function mediaCreateSettingsWithName(mediaName:String, mediaLength:Number, playerName:String, playerID:String):ADBMediaSettings;
		
		function mediaAdCreateSettingsWithName(adName:String, adLength:Number, playerName:String, parentName:String, podName:String, parentPosition:Number, CPM:String):ADBMediaSettings;
		
		function mediaOpenWithSettings(mediaDescriptor:ADBMediaSettings):void;
		
		function mediaPlay(name:String, position:Number):void;
		
		function mediaStop(name:String, position:Number):void;
		
		function mediaComplete(name:String, position:Number):void;
		
		function mediaClose(name:String):void;
		
		function mediaClick(name:String, position:Number):void;
		
		function mediaTrack(state:String, context:Object):void;
	}
}