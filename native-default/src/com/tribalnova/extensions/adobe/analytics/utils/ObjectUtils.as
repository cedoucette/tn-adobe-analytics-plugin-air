package com.tribalnova.extensions.adobe.analytics.utils
{
	public class ObjectUtils
	{
		public function ObjectUtils()
		{
			
		}
		
		static public function extractKeysFromObj(dict:Object):Array
		{
			var keyList:Array = [];
			for(var key:String in dict)
			{
				keyList.push(key);
			}
			return keyList;
		}
		
		static public function dump(obj:Object):void
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