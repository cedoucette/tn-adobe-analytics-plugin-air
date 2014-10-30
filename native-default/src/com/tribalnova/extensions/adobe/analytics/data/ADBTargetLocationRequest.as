package com.tribalnova.extensions.adobe.analytics.data
{
	import flash.utils.Dictionary;

	public class ADBTargetLocationRequest
	{
		private var _name:String;                   ///< The name of the target location.
		private var _defaultContent:String;         ///< The default content that should be returned if the request fails.
		private var _parameters:Dictionary; 		///< Optional. The parameters to be attached to the request.
		private var _parametersKeys:Array; 		///< Optional. The parameters to be attached to the request.
		
		public function ADBTargetLocationRequest(targetObj:Object = null)
		{
			populate(targetObj);
		}
		
		private function populate(targetObj:Object):void
		{
			if(targetObj == null)
				return;
			
			_name = targetObj["name"];
			_defaultContent = targetObj["defaultContent"];
			
			var params:Object = targetObj["parameters"];
			
			trace("Populate", _name, defaultContent, params);
			
			if(params == null)
				return;
			
			_parameters = new Dictionary();
			_parametersKeys = new Array();
			
			for (var key:String in params)
			{
				_parametersKeys.push(key);
				_parameters[key] = params[key];
			}			
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get defaultContent():String
		{
			return _defaultContent;
		}

		public function set defaultContent(value:String):void
		{
			_defaultContent = value;
		}

		public function get parameters():Dictionary
		{
			return _parameters;
		}

		public function set parameters(value:Dictionary):void
		{
			_parametersKeys = new Array();
			
			for (var key:String in value)
			{
				_parametersKeys.push(key);
			}
			
			_parameters = value;
		}

		public function get parametersKeys():Array
		{
			return _parametersKeys;
		}


	}
}