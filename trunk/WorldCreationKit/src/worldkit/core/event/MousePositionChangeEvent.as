package worldkit.core.event
{
	import flash.events.Event;
	
	public class MousePositionChangeEvent extends Event
	{
		
		public static const MOUSE_CHANGE_EVENT:String = "MouseChnageEvent";
		public var deltaX:Number = 0;
		public var deltaY:Number = 0;
		
		public function MousePositionChangeEvent(deltaX:Number,deltaY:Number, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.deltaX = deltaX;
			this.deltaY = deltaY;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new MousePositionChangeEvent(deltaX,deltaY,type,bubbles,cancelable);
		}
	}
}