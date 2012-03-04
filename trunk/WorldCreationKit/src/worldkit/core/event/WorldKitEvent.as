package worldkit.core.event
{
	import flash.events.Event;
	
	public class WorldKitEvent extends Event
	{
		public static const INIT_COMPLETE:String = "INIT_COMPLETE";
		public function WorldKitEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}