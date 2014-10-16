package
{
	import com.tribalnova.extensions.adobe.analytics.AdobeMobileAnalytics;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class AnalyticsExampleAIR extends Sprite
	{
		protected var _tf:TextField;
		protected var _ane:AdobeMobileAnalytics;
		
		public function AnalyticsExampleAIR()
		{
			super();
			
			_ane = AdobeMobileAnalytics.instance;
			
			_ane.privacyStatus = _ane.ADBMOBILE_PPRIVACYSTATUS_OPTIN;
			var dict:Object = new Object();
			dict["a"] = "aa";
			dict["b"] = "bb";
			dict["c"] = "cc";
			dict["d"] = "dd";
			_ane.trackState("Starting State", dict);
			
			_tf = new TextField();
			_tf.height = stage.stageHeight;
			_tf.width = stage.stageWidth;
			_tf.text = 'The next line should say "Hello world" :\n\n\t'
						+ _ane.helloWorld()
						+ '\n\n\t'
						+ _ane.version
						+ '\n\n\t'
						+ String(_ane.privacyStatus);
			addChild( _tf );
		}
	}
}