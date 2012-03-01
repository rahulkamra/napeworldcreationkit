package worldkit.core
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	import nape.geom.Vec2;
	import nape.space.Space;
	import nape.util.ShapeDebug;

	public class NapeController
	{

		public var space:Space;
		private var debug:ShapeDebug;
		public var mainSprite:Sprite;
		
		public function NapeController()
		{
			
		}
		
		public function initNape(stage:Stage,sprite:Sprite):void{
			
			space = new Space(new Vec2(0,600));
			debug = new ShapeDebug(600,600);
			sprite.addChild(debug.display);
			stage.addEventListener(Event.ENTER_FRAME,
			
		}
	}
}