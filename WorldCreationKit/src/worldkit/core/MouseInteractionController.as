package worldkit.core
{
	import flash.events.MouseEvent;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyList;
	
	import worldkit.data.BodyDO;

	public class MouseInteractionController
	{
		private static var model:MouseInteractionController; 
		
		public static function get Instance():MouseInteractionController{
			if(!model)
				model = new MouseInteractionController();
			
			return model;
		}
		
		
		public function MouseInteractionController()
		{
			if(model){
				throw new Error("Singleton error");
			}
			DrawingArea.Instance.stage.addEventListener(MouseEvent.CLICK,onClick);
			DrawingArea.Instance.stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			DrawingArea.Instance.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			DrawingArea.Instance.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			
		}
		
		private var isMouseDown:Boolean = false;
		
		private var previousMouseX:int = -1;
		private var previousMouseY:int = -1;
		
		protected function onMouseMove(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			if(!focusBody)
				return;	
			
			if(isMouseDown){
				if(previousMouseX == -1 || previousMouseY == -1){
					previousMouseX = DrawingArea.Instance.mouseX;
					previousMouseY = DrawingArea.Instance.mouseY;
				}
				var diffX:int = DrawingArea.Instance.mouseX - previousMouseX;
				var diffY:int = DrawingArea.Instance.mouseY - previousMouseY;
				trace(diffX,diffY)
					
				var bodyDO:BodyDO = DrawingArea.Instance.bodyKeyDict[focusBody];
				bodyDO.x = bodyDO.x + diffX;
				bodyDO.y = bodyDO.y + diffY;
				previousMouseX = DrawingArea.Instance.mouseX;
				previousMouseY = DrawingArea.Instance.mouseY;
				
			}
		}
		
		protected function onMouseUp(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			previousMouseX = -1
			previousMouseY = -1
			isMouseDown = false;
		}
		
		protected function onMouseDown(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			isMouseDown = true;
		}
		
		protected function onClick(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var mp:Vec2 = new Vec2(DrawingArea.Instance.mouseX,DrawingArea.Instance.mouseY);
			var list:BodyList = DrawingArea.Instance.space.bodiesUnderPoint(mp)
			if(list.length == 0){
				removeFocusBody();
			}else{
				var body:Body = list.at(0);
				removeFocusBody();
				addFocusBody(body);
			}
			
		}
		
		
		
		
		
		private var focusBody:Body;
		public function addFocusBody(body:Body):void{
			if(body == focusBody)return;
			if(focusBody){
				removeFocusBody();
			}
			DrawingArea.Instance.makeBodyDirty(body);
			focusBody = body;
			focusBody.graphicUpdate = HighlightController.Instance.createHighlighter;
		}
		
		public function removeFocusBody():void{
			if(focusBody){
				focusBody.graphicUpdate = null;
				focusBody = null;
			}
		}
		
		
		
		
			
	}
}