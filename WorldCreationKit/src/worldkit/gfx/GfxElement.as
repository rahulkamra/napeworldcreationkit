package worldkit.gfx
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import worldkit.core.DrawingArea;
	import worldkit.core.MouseInteractionController;
	import worldkit.data.BodyDO;
	
	public class GfxElement extends Sprite
	{
		private var isResizablePointsActive:Boolean = false;
		public var data:BodyDO;
			
		public function GfxElement(bodyDO:BodyDO)
		{
			super();
			this.data = bodyDO;
			addEventListener(Event.ENTER_FRAME,enterFrame);
			addEventListener(MouseEvent.CLICK,onClick);
			addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		}
		
		
		private function enterFrame(event:Event):void{
			syncResizableContainerPoints();
			syncData();	
		}
		
		
		
		protected function syncData():void{
			data.x = x;
			data.y = y;
		}
		
		
		
		protected function onMouseDown(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			MouseInteractionController.Instance.onMouseDown(this);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			MouseInteractionController.Instance.onClick(this);
		}
		
		public function activateResizableContainer():void{
			isResizablePointsActive = true;
		}
		public function deActivateResizableContainer():void{
			isResizablePointsActive = false;
		}
		
		private function syncResizableContainerPoints():void
		{
			// TODO Auto Generated method stub
			if(!isResizablePointsActive)return;
			
			if(circlesArray.length == 0){
				initSprite();
			}
			
			(circlesArray[0] as Sprite).x = 0;
			(circlesArray[0] as Sprite).y = 0;
				
		}
		
		private var circlesArray:Array = new Array;
		
		private function initSprite():void{
			var sprite:Sprite = new Sprite();
			
			// create 6 small circles
			
			var firstCircle:Sprite = new Sprite();
			firstCircle.graphics.lineStyle(1);
			firstCircle.graphics.beginFill(0xff2200);
			firstCircle.graphics.drawCircle(0,0,5);
			firstCircle.graphics.endFill();
			circlesArray.push(firstCircle);
			trace("Creating");
			this.addChild(firstCircle);
		}
	}
}