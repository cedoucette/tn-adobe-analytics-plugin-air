package com.tribalnova.extensions.adobe.analytics.data
{
	public class ADBMediaSettings
	{
		private var _segmentByMilestones:Boolean;				///< Indicates if segment info should be automatically generated for milestones generated or not, the default is false.
		private var _segmentByOffsetMilestones:Boolean;			///< Indicates if segment info should be automatically generated for offset milestones or not, the default is false.
		private var _length:Number;								///< The length of the media item in seconds.
		private var _channel:String;							///< The name or ID of the channel.
		private var _name:String;								///< The name or ID of the media item.
		private var _playerName:String;							///< The name of the media player.
		private var _playerID:String;							///< The ID of the media player.
		private var _milestones:String;							///< A comma-delimited list of intervals (as a percentage) for sending tracking data.
		private var _offsetMilestones:String;					///< A comma-delimited list of intervals (in seconds) for sending tracking data.
		private var _trackSeconds:uint;							///< The interval at which tracking data should be sent, the default is 0.
		private var _completeCloseOffsetThreshold:uint;			///< The number of second prior to the end of the media that it should be considered complete, the default is 1.
		
		//Ad Parameters
		private var _isMediaAd:Boolean;							///< Indicates if the media item is an ad or not.
		private var _parentPodPosition:Number;					///< The position within the pod where the ad is played.
		private var _CPM:String;								///< The CMP or encrypted CPM (prefixed with a "~") for the media item.
		private var _parentName:String;							///< The name or ID of the media item that the ad is embedded in.
		private var _parentPod:String;							///< The position in the primary content the ad was played.
		
		public function ADBMediaSettings(settingsObj:Object = null)
		{
			populate(settingsObj);	
		}
		
		private function populate(settingsObj:Object):void
		{
			if(settingsObj == null)
				return;
			
			_segmentByMilestones = settingsObj["segmentByMilestones"];
			_segmentByOffsetMilestones = settingsObj["segmentByOffsetMilestones"];
			_length = settingsObj["length"];
			_channel = settingsObj["channel"];
			_name = settingsObj["name"];
			_playerName = settingsObj["playerName"];
			_playerID = settingsObj["playerID"];
			_milestones = settingsObj["milestones"];
			_offsetMilestones = settingsObj["offsetMilestones"];
			_trackSeconds = settingsObj["trackSeconds"];
			_completeCloseOffsetThreshold = settingsObj["completeCloseOffsetThreshold"];
			
			_isMediaAd = settingsObj["isMediaAd"];
			_parentPodPosition = settingsObj["parentPodPosition"];
			_CPM = settingsObj["CPM"];
			_parentName = settingsObj["parentName"];
			_parentPod = settingsObj["parentPod"];
		}

		public function get segmentByMilestones():Boolean
		{
			return _segmentByMilestones;
		}

		public function set segmentByMilestones(value:Boolean):void
		{
			_segmentByMilestones = value;
		}

		public function get segmentByOffsetMilestones():Boolean
		{
			return _segmentByOffsetMilestones;
		}

		public function set segmentByOffsetMilestones(value:Boolean):void
		{
			_segmentByOffsetMilestones = value;
		}

		public function get length():Number
		{
			return _length;
		}

		public function set length(value:Number):void
		{
			_length = value;
		}

		public function get channel():String
		{
			return _channel;
		}

		public function set channel(value:String):void
		{
			_channel = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get playerName():String
		{
			return _playerName;
		}

		public function set playerName(value:String):void
		{
			_playerName = value;
		}

		public function get playerID():String
		{
			return _playerID;
		}

		public function set playerID(value:String):void
		{
			_playerID = value;
		}

		public function get milestones():String
		{
			return _milestones;
		}

		public function set milestones(value:String):void
		{
			_milestones = value;
		}

		public function get offsetMilestones():String
		{
			return _offsetMilestones;
		}

		public function set offsetMilestones(value:String):void
		{
			_offsetMilestones = value;
		}

		public function get trackSeconds():uint
		{
			return _trackSeconds;
		}

		public function set trackSeconds(value:uint):void
		{
			_trackSeconds = value;
		}

		public function get completeCloseOffsetThreshold():uint
		{
			return _completeCloseOffsetThreshold;
		}

		public function set completeCloseOffsetThreshold(value:uint):void
		{
			_completeCloseOffsetThreshold = value;
		}

		public function get isMediaAd():Boolean
		{
			return _isMediaAd;
		}

		public function set isMediaAd(value:Boolean):void
		{
			_isMediaAd = value;
		}

		public function get parentPodPosition():Number
		{
			return _parentPodPosition;
		}

		public function set parentPodPosition(value:Number):void
		{
			_parentPodPosition = value;
		}

		public function get CPM():String
		{
			return _CPM;
		}

		public function set CPM(value:String):void
		{
			_CPM = value;
		}

		public function get parentName():String
		{
			return _parentName;
		}

		public function set parentName(value:String):void
		{
			_parentName = value;
		}

		public function get parentPod():String
		{
			return _parentPod;
		}

		public function set parentPod(value:String):void
		{
			_parentPod = value;
		}


	}
}