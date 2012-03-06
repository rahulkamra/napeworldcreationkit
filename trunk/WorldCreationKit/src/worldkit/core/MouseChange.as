package worldkit.core
{
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import worldkit.core.event.MousePositionChangeEvent;
	
	public class MouseChange extends EventDispatcher
		
	{
		private var previousMouseX:int = -1;
		private var previousMouseY:int = -1;
		private var _isRunning:Boolean = false 
		
		private var mode:String;
		public static const RELATIVE:String ="Relative"; 
		public static const LIVE:String ="Live"; 
		
		public function MouseChange(stage:Stage)
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMove);
		}
		
		public function start(mode:String = LIVE):void{
			this._isRunning = true;
			this.mode = mode;
			
		}
		
			
		public function stop(reset:Boolean = true):void{
			if(reset){
				previousMouseX = -1;
				previousMouseY = -1;
			}
			this._isRunning = false;
		}
		protected function mouseMove(event:MouseEvent):void
		{
			if(!_isRunning)return;
			
			if(previousMouseX == -1 || previousMouseY == -1){
				previousMouseX = DrawingArea.Instance.mouseX;
				previousMouseY = DrawingArea.Instance.mouseY;
			}
			var diffX:int = DrawingArea.Instance.mouseX - previousMouseX;
			var diffY:int = DrawingArea.Instance.mouseY - previousMouseY;
			
			dispatchEvent(new MousePositionChangeEvent(diffX,diffY,MousePositionChangeEvent.MOUSE_CHANGE_EVENT));
			
			if(mode == LIVE){
				previousMouseX = DrawingArea.Instance.mouseX;
				previousMouseY = DrawingArea.Instance.mouseY;
			}
			
		}
		
		
	}
}