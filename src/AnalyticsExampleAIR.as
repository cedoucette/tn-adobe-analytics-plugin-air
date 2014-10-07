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
			
			_tf = new TextField();
			_tf.height = stage.stageHeight;
			_tf.width = stage.stageWidth;
			_tf.text = 'The next line should say "Hello world" :\n\n\t'
						+ _ane.helloWorld();
			addChild( _tf );
		}
	}
}