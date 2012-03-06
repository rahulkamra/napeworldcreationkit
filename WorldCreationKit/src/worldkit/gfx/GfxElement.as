package worldkit.gfx
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import worldkit.core.DrawingArea;
	import worldkit.core.MouseInteractionController;
	import worldkit.core.ui.CircleDot;
	import worldkit.data.BodyDO;
	
	public class GfxElement extends Sprite
	{
		private var isResizablePointsActive:Boolean = false;
		public var data:BodyDO;
		public var mainContainer:Sprite = new Sprite();
			
		public function GfxElement(bodyDO:BodyDO)
		{
			super();
			this.data = bodyDO;
			addChild(mainContainer);
			addEventListener(Event.ENTER_FRAME,enterFrame);
			addEventListener(MouseEvent.CLICK,onClick);
			addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		}
		
		
		private function enterFrame(event:Event):void{
			syncData();
			//syncResizableContainerPoints();
		}
		
		protected function syncData():void{
			data.x = x;
			data.y = y;
		}
		
		
		protected function onMouseDown(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			
			
			MouseInteractionController.Instance.onMouseDown(this,event);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			MouseInteractionController.Instance.onClick(this);
			syncResizableContainerPoints();
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
			
			for(var count:int= 0 ; count < circlesArray.length ; count++){
				var sprite:CircleDot = circlesArray[count] as CircleDot;
				this.addChild(sprite);
			}
			
			resetCirclesPosition();
				
		}
		
		
		/**
		 * 
		 * 
		 * 
		 **/
		private static var circlesArray:Array = new Array;
		
		private function initSprite():void{
			// create 6 small circles
			
			circlesArray.push(new CircleDot(CircleDot.BOTTOM_CENTER));
			circlesArray.push(new CircleDot(CircleDot.BOTTOM_LEFT));
			circlesArray.push(new CircleDot(CircleDot.BOTTOM_RIGHT));
			circlesArray.push(new CircleDot(CircleDot.LEFT_CENTER));
			circlesArray.push(new CircleDot(CircleDot.LEFT_TOP));
			circlesArray.push(new CircleDot(CircleDot.RIGHT_CENTER));
			circlesArray.push(new CircleDot(CircleDot.TOP_CENTER));
			circlesArray.push(new CircleDot(CircleDot.TOP_RIGHT));
			
		}
		
		private function resetCirclesPosition():void{
			
			for(var count:int= 0 ; count < circlesArray.length ; count++){
				var sprite:CircleDot = circlesArray[count] as CircleDot;
				switch(sprite.type){
					case CircleDot.BOTTOM_CENTER : {
						
						break;
					}
					case CircleDot.BOTTOM_LEFT : {
						sprite.x = 0;
						sprite.y = mainContainer.height;
						break;
					}
					case CircleDot.BOTTOM_RIGHT : {
						sprite.x = mainContainer.width;
						sprite.y = mainContainer.height;
						break;
					}
					case CircleDot.LEFT_CENTER : {
						break;
					}
					case CircleDot.LEFT_TOP : {
						sprite.x = 0;
						sprite.y = 0;
						break;
					}
					case CircleDot.RIGHT_CENTER : {
						break;
					}
					case CircleDot.TOP_CENTER : {
						break;
					}
					case CircleDot.TOP_RIGHT : {
						sprite.x = mainContainer.width;
						sprite.y = 0;
						break;
					}
				}
			}
		}
		
		
		public function changeSize(width:int,height:int):void{
			resetCirclesPosition();
		}
		
		
		
		
	}
}