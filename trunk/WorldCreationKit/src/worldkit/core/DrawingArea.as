package worldkit.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import worldkit.data.WorldDO;
	import worldkit.gfx.GfxElement;

	public class DrawingArea extends Sprite
	{
		private static var model:DrawingArea; 
		
		public function DrawingArea()
		{
			if(model){
				throw new Error("Singleton error");
			}
		}
		
		public var world:WorldDO;
		public static function get Instance():DrawingArea{
			if(!model){
				model = new DrawingArea();
				model.addEventListener(Event.ADDED_TO_STAGE,model.addedToStage);
			}
			return model;
		}
		
		
		private function addedToStage(event:Event):void{
			world = new WorldDO;
		}
		
		public function addToWorld(gfxElement:GfxElement):void{
			world.bodies.push(gfxElement.data);
			addChild(gfxElement);
		}
		
	}
}