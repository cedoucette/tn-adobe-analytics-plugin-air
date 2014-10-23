package com.tribalnova.extensions.adobe.analytics.impl
{
	import com.tribalnova.extensions.adobe.analytics.IADBMobileMediaAnalytics;
	
	import flash.external.ExtensionContext;
	
	public class ADBMobileMediaAnalyticsImpl implements IADBMobileMediaAnalytics
	{
		private var _extContext:ExtensionContext;
		
		public function ADBMobileMediaAnalyticsImpl(extensionContext:ExtensionContext)
		{
			_extContext = extensionContext;
		}
		
		public function mediaCreateSettingsWithName(mediaName:String, mediaLength:Number, playerName:String, playerID:String):Object
		{
			var obj:Object = _extContext.call( "mediaCreateSettingsWithName", mediaName, mediaLength, playerName, playerID);
			//dump(obj);
			return obj;
		}
		
		public function mediaAdCreateSettingsWithName(adName:String, adLength:Number, playerName:String, parentName:String, podName:String, parentPosition:Number, CPM:String):Object
		{
			return _extContext.call( "mediaAdCreateSettingsWithName", adName, adLength, playerName, parentName, podName, parentPosition, CPM);
		}
		
		public function mediaOpenWithSettings(mediaDescriptor:Object):void
		{
			//dump(mediaDescriptor);
			_extContext.call( "mediaOpenWithSettings", mediaDescriptor);
		}
		
		public function mediaPlay(name:String, position:Number):void
		{
			_extContext.call( "mediaPlay", name, position);
		}
		
		public function mediaStop(name:String, position:Number):void
		{
			_extContext.call( "mediaStop", name, position);
		}
		
		public function mediaComplete(name:String, position:Number):void
		{
			_extContext.call( "mediaComplete", name, position);
		}
		
		public function mediaClose(name:String):void
		{
			_extContext.call( "mediaClose", name);
		}
		
		public function mediaClick(name:String, position:Number):void
		{
			_extContext.call( "mediaClick", name, position);
		}
		
		public function mediaTrack(state:String, context:Object):void
		{
			_extContext.call( "mediaTrack", state, context);
		}
		
		private function dump(obj:Object):void
		{
			trace("{");
			for (var key:String in obj) 
			{
				trace(key+" => "+obj[key]);
				
			}
			trace("}")
			
			
		}
	}
}