package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileMediaAnalytics;
	import com.tribalnova.extensions.adobe.analytics.ObjectUtils;
	import com.tribalnova.extensions.adobe.analytics.data.ADBMediaSettings;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileMediaAnalyticsImpl implements IADBMobileMediaAnalytics
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileMediaAnalyticsImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function mediaCreateSettingsWithName(mediaName:String, mediaLength:Number, playerName:String, playerID:String):ADBMediaSettings
		{
			//var obj:Object = _extContext.call( "mediaCreateSettingsWithName", mediaName, mediaLength, playerName, playerID);
			//ObjectUtils.dump(obj);
			var obj:Object = {mediaName:mediaName, mediaLength:mediaLength, playerName:playerName, playerID:playerID};
			return new ADBMediaSettings(obj);
		}
		
		public function mediaAdCreateSettingsWithName(adName:String, adLength:Number, playerName:String, parentName:String, podName:String, parentPosition:Number, CPM:String):ADBMediaSettings
		{
			//return _extContext.call( "mediaAdCreateSettingsWithName", adName, adLength, playerName, parentName, podName, parentPosition, CPM);
			return new ADBMediaSettings({adName:adName, adLength:adLength, playerName:playerName, parentName:parentName, podName:podName, parentPosition:parentPosition, CPM:CPM});
		}
		
		public function mediaOpenWithSettings(mediaDescriptor:ADBMediaSettings):void
		{
			//ObjectUtils.dump(mediaDescriptor);
			//_extContext.call( "mediaOpenWithSettings", mediaDescriptor);
		}
		
		public function mediaPlay(name:String, position:Number):void
		{
			//_extContext.call( "mediaPlay", name, position);
		}
		
		public function mediaStop(name:String, position:Number):void
		{
			//_extContext.call( "mediaStop", name, position);
		}
		
		public function mediaComplete(name:String, position:Number):void
		{
			//_extContext.call( "mediaComplete", name, position);
		}
		
		public function mediaClose(name:String):void
		{
			//_extContext.call( "mediaClose", name);
		}
		
		public function mediaClick(name:String, position:Number):void
		{
			//_extContext.call( "mediaClick", name, position);
		}
		
		public function mediaTrack(state:String, context:Object):void
		{
			//_extContext.call( "mediaTrack", state, context);
		}
	}
}