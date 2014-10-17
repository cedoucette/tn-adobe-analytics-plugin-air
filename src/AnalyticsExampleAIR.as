package
{
	import com.tribalnova.extensions.adobe.analytics.AdobeMobileAnalytics;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class AnalyticsExampleAIR extends Sprite
	{
		protected var _tf:TextField;
		protected var _ane:AdobeMobileAnalytics;
		private var _sp:Sprite;
		
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
			
			_sp = new Sprite();
			_sp.graphics.beginFill(0xFF0000, 1);
			_sp.graphics.drawRoundRect(0, 0, 100, 50, 20);
			_sp.graphics.endFill();
			_sp.x = stage.stageWidth - (_sp.width + 10);
			_sp.y = 20;
			_sp.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			_sp.addEventListener(MouseEvent.MOUSE_UP, onUp);
			_sp.addEventListener(MouseEvent.CLICK, onClick);
			
			
			addChild(_sp);
			
		}
		
		protected function onClick(event:MouseEvent):void
		{
			var obj:Object = { "clicky1": "one", "clicky2": "two", "clicky3": "three", "clicky4": "four" };
			
			_ane.trackAction("Button Click", obj);
		}
		
		protected function onUp(event:MouseEvent):void
		{
			_sp.graphics.beginFill(0xFF0000, 1);
			_sp.graphics.drawRoundRect(0, 0, 100, 50, 20);
			_sp.graphics.endFill();
		}
		
		protected function onDown(event:MouseEvent):void
		{
			_sp.graphics.beginFill(0x00FF00, 1);
			_sp.graphics.drawRoundRect(0, 0, 100, 50, 20);
			_sp.graphics.endFill();
			
		}		
		
	}
}