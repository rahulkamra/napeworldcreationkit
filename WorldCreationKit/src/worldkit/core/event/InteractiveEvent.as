package worldkit.core.event
{
	import flash.events.Event;
	
	import nape.phys.Body;
	
	public class InteractiveEvent extends Event
	{
		public static const HIGHLIGHT_EVENT:String = "HighlightEvent";
		public var body:Body;
		
		public function InteractiveEvent(body:Body,type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.body = body; 
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new InteractiveEvent(body,type,bubbles,cancelable);
		}
	}
}