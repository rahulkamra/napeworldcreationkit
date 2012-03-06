package worldkit.core
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import worldkit.gfx.GfxElement;

	public class MouseInteractionController
	{
		private static var model:MouseInteractionController; 
		
		public function MouseInteractionController()
		{
			if(model){
				throw new Error("Singleton error");
			}
		}
		
		public static function get Instance():MouseInteractionController{
			if(!model){
				model = new MouseInteractionController();
				DrawingArea.Instance.stage.addEventListener(MouseEvent.MOUSE_UP,model.onMouseUp);
				DrawingArea.Instance.stage.addEventListener(MouseEvent.MOUSE_MOVE,model.mouseMove);
				
			}
			
			return model;
		}
		
		private var isMouseDown:Boolean = false;
		private var previousMouseX:int = -1;
		private var previousMouseY:int = -1;
		public var focusElement:GfxElement;
		public var mouseDownElement:GfxElement;
		
		public function onClick(element:GfxElement):void{
			if(focusElement == element)return;
			if(focusElement){
				removeFocus(focusElement);
			}
			addFocus(element);
		}

		public function onMouseDown(element:GfxElement):void{
			isMouseDown = true;
			mouseDownElement = element;
		}
		
		public function onMouseUp(event:Event):void{
			previousMouseX = -1
			previousMouseY = -1
			isMouseDown = false;
		}
		
		public function mouseMove(event:Event):void{
			if(!focusElement)
				return;	
			if(isMouseDown && mouseDownElement == focusElement){
				if(previousMouseX == -1 || previousMouseY == -1){
					previousMouseX = DrawingArea.Instance.mouseX;
					previousMouseY = DrawingArea.Instance.mouseY;
				}
				var diffX:int = DrawingArea.Instance.mouseX - previousMouseX;
				var diffY:int = DrawingArea.Instance.mouseY - previousMouseY;
				
				focusElement.x = focusElement.x  + diffX;
				focusElement.y = focusElement.y  + diffY;
				
				previousMouseX = DrawingArea.Instance.mouseX;
				previousMouseY = DrawingArea.Instance.mouseY;
				
			}
		}
		
		
		/**
		 * 
		 * 
		 **/
		
		public function addFocus(gfxElement:GfxElement):void{
			focusElement  = gfxElement;
			gfxElement.activateResizableContainer();
		}
		public function removeFocus(gfxElement:GfxElement):void{
			focusElement  = null;
			gfxElement.deActivateResizableContainer();
		}

	}
}