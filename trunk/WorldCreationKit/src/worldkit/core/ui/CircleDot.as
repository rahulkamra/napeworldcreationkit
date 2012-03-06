package worldkit.core.ui
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class CircleDot extends Sprite
	{
		public static const LEFT_TOP:String  = "LeftTop";
		public static const TOP_CENTER:String  = "TopCenter";
		public static const TOP_RIGHT:String  = "TopRight";
		
		public static const LEFT_CENTER:String  = "LeftCenter";
		public static const BOTTOM_LEFT:String  = "BottomLeft";
		
		public static const BOTTOM_CENTER:String  = "BottomCenter";
		public static const BOTTOM_RIGHT:String  = "BottomRight";
		
		public static const RIGHT_CENTER:String  = "RightCenter";
		
		public var type:String;
		
		public function CircleDot(type:String)
		{
			super();
			this.type = type;
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0xff2200);
			this.graphics.drawCircle(0,0,5);
			this.graphics.endFill();
		}
		
	}
}