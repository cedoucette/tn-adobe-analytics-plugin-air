package
{
	import com.tribalnova.extensions.adobe.analytics.AdobeMobileAnalytics;
	import com.tribalnova.extensions.adobe.analytics.data.ADBMediaSettings;
	import com.tribalnova.extensions.adobe.analytics.data.ADBTargetLocationRequest;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	
	import uk.co.soulwire.gui.SimpleGUI;
	
	[SWF(backgroundColor="#FFFFFF", width="768", height="980", frameRate="60")]
	public class AnalyticsExampleAIR extends Sprite
	{
		protected var _tf:TextField;
		private var _ane:AdobeMobileAnalytics;
		private var _sp:Sprite;
		private var _gui:SimpleGUI;
		
		public var privacyStatus:Number = 3;
		private var _timedActionExists:Boolean;
		public var lifeTimevalue:Number;
		private var _mediaSettings:ADBMediaSettings;
		private var _request:ADBTargetLocationRequest;
		
		public function AnalyticsExampleAIR()
		{
			super();
			
			scaleX = scaleY = (Capabilities.screenDPI/132)/1.5;
			
			_gui = new SimpleGUI(this, "Adobe Analytics ANE Test App");
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			lifeTimevalue = ane.configuration.lifetimeValue;
			addConfigGroup();
			_gui.addGroup(" ");
			_gui.addLabel("  ");
			addTargetGroup();
			
			_gui.addColumn();
			_gui.addGroup("  ");
			addAnalyticsGroup();
			_gui.addGroup(" ");
			_gui.addLabel("  ");
			_gui.addLabel("");
			addLocationGroup();
			
			_gui.addColumn();
			_gui.addGroup(" ");
			addMediaAnalyticsGroup()
			_gui.addGroup();
			_gui.addLabel("  ");
			_gui.addLabel("");
			addAudienceGroup();
			
			_gui.show();
			
		}
		
		private function addMediaAnalyticsGroup():void
		{
			//Media Analytics group
			_gui.addGroup("Media Analytics");
			_gui.addGroup();
			_gui.addButton("Create Setting Named 'Doctor'", {	callback:onMediaSettings,
																callbackParams: ['create', 'Doctor']
															});
			_gui.addButton("Create Ad Setting Named 'Amy'", {	callback:ane.mediaAnalytics.mediaAdCreateSettingsWithName,
				callbackParams: ['Amy', 10, 'AmyPlayer', 'Doctor', 'Tardis', 60 ,42]
			});
			_gui.addGroup();
			_gui.addButton("Open Media from settings", {	callback:onMediaSettings,
															callbackParams: ['open']
														});
			_gui.addGroup();
			_gui.addButton("Play media 'Doctor'", {	callback:ane.mediaAnalytics.mediaPlay,
				callbackParams: ['Doctor', 0]
			});
			_gui.addButton("Stop media 'Doctor'", {	callback:ane.mediaAnalytics.mediaStop,
				callbackParams: ['Doctor', 60]
			});
			_gui.addButton("Complete media 'Doctor'", {	callback:ane.mediaAnalytics.mediaComplete,
				callbackParams: ['Doctor', 120]
			});
			_gui.addButton("Close media 'Doctor'", {	callback:ane.mediaAnalytics.mediaClose,
				callbackParams: ['Doctor']
			});
			
		}
		
		private function addAnalyticsGroup():void
		{
			//Analytics group
			_gui.addGroup("Analytics");
			_gui.addGroup();
			_gui.addLabel("trackingIdentifier : ");
			_gui.addLabel(ane.analytics.trackingIdentifier);
			_gui.addButton("Track State", {	callback:ane.analytics.trackState, 
				callbackParams:["Hello State", { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" }]  
			});
			_gui.addButton("Track Action", {callback:ane.analytics.trackAction, 
				callbackParams:["Ping background action!", { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" }]  
			});
			_gui.addButton("Track Action From Background", {callback:ane.analytics.trackActionFromBackground, 
				callbackParams:["Ping action!", { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" }]  
			});
			

			_gui.addGroup();
			
			_gui.addButton("Track TimedAction Start", {callback:onTimedActionChange, 
				callbackParams:["TimedAction", "start"]
			});
			_gui.addButton("Track TimedAction Update", {callback:onTimedActionChange, 
				callbackParams:["TimedAction", "update"]  
			});
			_gui.addButton("Track TimedAction End", {callback:onTimedActionChange, 
				callbackParams:["TimedAction", "end"]  
			});
			_gui.addToggle("timedActionExists", {label:"TimedAction Exists"});
			
			
			_gui.addGroup();
			_gui.addStepper('ane.analytics.trackingQueueSize', ane.analytics.trackingQueueSize, ane.analytics.trackingQueueSize, {label:"Tracking Queue Size"});
			_gui.addButton("Send Queued Hits", {callback:ane.analytics.trackingSendQueuedHits });
			_gui.addButton("Clear Queue", {callback:ane.analytics.trackingClearQueue });
			
		}
		
		private function addConfigGroup():void
		{
			//Config group
			_gui.addGroup("Configuration");
			_gui.addGroup();
			_gui.addLabel("ADB Version : "+ane.configuration.version);
			_gui.addStepper("lifeTimevalue", lifeTimevalue, lifeTimevalue + 50, { label: "Lifetime Value", callback:onIncreaseLifeTime });
			_gui.addGroup();
			var strA:String = generateRandomString(Math.floor(Math.random()*9 + 5));
			var strB:String = generateRandomString(Math.floor(Math.random()*9 + 5));
			var strC:String = generateRandomString(Math.floor(Math.random()*9 + 5));
			var strD:String = generateRandomString(Math.floor(Math.random()*9 + 5));
			
			_gui.addComboBox("ane.configuration.userIdentifier", [
				{label: ane.configuration.userIdentifier, data:ane.configuration.userIdentifier},
				{label: strA, data:strA},
				{label: strB, data:strB},
				{label: strC, data:strC},
				{label: strD, data:strD},
			],
				{label: "User Identifier"});
			
			_gui.addComboBox("ane.configuration.privacyStatus", [
				{label:"opt-in", data:ane.configuration.ADBMOBILE_PPRIVACYSTATUS_OPTIN},
				{label:"opt-out", data:ane.configuration.ADBMOBILE_PPRIVACYSTATUS_OPTOUT},
				{label:"unknown", data:ane.configuration.ADBMOBILE_PPRIVACYSTATUS_UNKNOWN},
			],
				{label: "Privacy Status"});
			_gui.addToggle("ane.configuration.debugLogging", {label: "Debug Logging"});
			_gui.addButton("Collect Lifecycle Data", {callback:ane.configuration.collectLifecycleData});
			_gui.addButton("Keep Lifecycle Session Alive", {callback:ane.configuration.keepLifecycleSessionAlive});
		}
		
		
		private function addAudienceGroup():void
		{
			_gui.addGroup("Audience");
			_gui.addGroup();
			_gui.addLabel("DPID: "+ ane.audience.audienceDpid);
			_gui.addLabel("DPUUID: "+ ane.audience.audienceDpuuid);
			_gui.addButton("Signal with Data", {
												callback:ane.audience.audienceSignalWithData, 
												callbackParams: [{ "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" }]
												});
			_gui.addButton("Reset", {callback:ane.audience.audienceReset});
			_gui.addButton("Get Visitor Profile", {callback:onGetVisitorProfile});
		}
		
		private function addTargetGroup():void
		{
			_gui.addGroup("Target");
			_gui.addGroup();
			_gui.addButton("Create Request", { 	callback: onRequest, 
												callbackParams: [ "create"]
											});
			_gui.addButton("Create Order Confirm Request");
			_gui.addButton("Load Request", { 	callback: onRequest, 
												callbackParams: [ "load"]
											});
			_gui.addButton("Clear Cookies", {callback: ane.target.targetClearCookies});
		}
		
		private function addLocationGroup():void
		{
			_gui.addGroup("Not Yet Implemented");
			
			_gui.addGroup("Location");
			_gui.addButton("Track Location");
			_gui.addButton("Track Beacon");
			_gui.addButton("Tracking Clear Beacon");
		}
		
		private function onGetVisitorProfile():void
		{
			var profile:Object = ane.audience.audienceVisitorProfile;
			
			var str:String = "{";
			for (var key:String in profile) 
			{
				str += "\n";
				str += key+" => "+profile[key];
				
			}
			str += "}";
			
			_gui.addGroup();
			_gui.addLabel(str);
		}
		
		
		private function onRequest(type:String):void
		{
			if(type == "create")
			{
				var params:Dictionary = new Dictionary();
				_request = ane.target.targetCreateRequestWithName("requestName", "defaultRequestContent", params);
				trace(_request.name, _request.defaultContent, _request.parameters, _request.parametersKeys);
				trace("onRequest created");
			}
			else if(type == "load")
			{
				trace(_request);
				ane.target.targetLoadRequest(_request);
				trace("onRequest loaded");
			}
		}
		
		private function onIncreaseLifeTime():void
		{
			var increase:Number = lifeTimevalue - ane.configuration.lifetimeValue;
			if(increase > 0)
				ane.analytics.trackLifetimeValueIncrease(increase, { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" });
			else
				lifeTimevalue = ane.configuration.lifetimeValue;
		}
		
		private function onTimedActionChange(name:String, change:String):void
		{
			if(change == "start")
				ane.analytics.trackTimedActionStart(name, { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" });
			else if(change == "update")
				ane.analytics.trackTimedActionUpdate(name, { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" });
			else if(change == "end")
				ane.analytics.trackTimedActionEnd(name, { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" });
			
			_timedActionExists = ane.analytics.trackingTimedActionExists(name);
		}
		
		private function onMediaSettings(type:String, name:String = ""):void
		{
			if(type == 'create')
				_mediaSettings = ane.mediaAnalytics.mediaCreateSettingsWithName(name, 120, 'player'+name, 'doctorTardis');
			else if (type == 'open')
				ane.mediaAnalytics.mediaOpenWithSettings(_mediaSettings);
		}
		
		private function generateRandomString(strlen:Number):String{
			var chars:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			var num_chars:Number = chars.length - 1;
			var randomChar:String = "";
			
			for (var i:Number = 0; i < strlen; i++){
				randomChar += chars.charAt(Math.floor(Math.random() * num_chars));
			}
			return randomChar;
		}
		
		public function get ane():AdobeMobileAnalytics
		{
			if(_ane == null)
				_ane = AdobeMobileAnalytics.instance;
			
			return _ane;
		}	
		
		public function get timedActionExists():Boolean
		{
			return _timedActionExists;
		}
		
	}
}