package worldkit.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import worldkit.core.event.MousePositionChangeEvent;
	import worldkit.core.ui.CircleDot;
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
				model.mouseChange = new MouseChange(DrawingArea.Instance.stage);
				model.mouseChange.addEventListener(MousePositionChangeEvent.MOUSE_CHANGE_EVENT,model.mouseChangeHandler);
			}
			
			return model;
		}
		
		private var isMouseDown:Boolean = false;
		private var mouseChange:MouseChange;
		
		public var focusElement:GfxElement;
		public var mouseDownElement:GfxElement;
		public var mouseDownTarget:Sprite;
		
		public function onClick(element:GfxElement):void{
			if(focusElement == element)return;
			
			if(focusElement){
				removeFocus(focusElement);
			}
			addFocus(element);
		}

		public function onMouseDown(element:GfxElement,event:Event):void{
			
			isMouseDown = true;
			mouseChange.start();
			
			mouseDownTarget = event.target as Sprite;
			mouseDownElement = element;
		}
		
		public function onMouseUp(event:Event):void{
			isMouseDown = false;
			mouseChange.stop();
		}
		
		public function mouseChangeHandler(event:MousePositionChangeEvent):void{
			if(!focusElement)
				return;	
			trace(event.deltaX)
			
			if(mouseDownTarget is CircleDot){
				handleMove(mouseDownTarget as CircleDot,event.deltaX,event.deltaY);
				return;
			}
			
			if(isMouseDown && mouseDownElement == focusElement){
				focusElement.x = focusElement.x  + event.deltaX;
				focusElement.y = focusElement.y  + event.deltaY;
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
		
		
		
		/**
		 * 
		 * 
		 * 
		 **/
	
		
		private function handleMove(circle:CircleDot,deltaX:Number,deltaY:Number):void
		{
			// TODO Auto Generated method stub
			switch(circle.type){
				case CircleDot.BOTTOM_CENTER : {
					
					break;
				}
				case CircleDot.BOTTOM_LEFT : {
					break;
				}
				case CircleDot.BOTTOM_RIGHT : {
					focusElement.changeSize((focusElement.mainContainer.width +deltaX),(focusElement.mainContainer.height +deltaY)); 
					break;
				}
				case CircleDot.LEFT_CENTER : {
					break;
				}
				case CircleDot.LEFT_TOP : {
					break;
				}
				case CircleDot.RIGHT_CENTER : {
					break;
				}
				case CircleDot.TOP_CENTER : {
					break;
				}
				case CircleDot.TOP_RIGHT : {
					 
					break;
				}
			}
		}
		
		
		private function changeSize(width:int,height:int):void{
			
		}

	}
}