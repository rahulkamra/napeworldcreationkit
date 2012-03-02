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
		private var stage:Stage;
		
		private static var model:NapeController;
		
		public function NapeController()
		{
			if(model != null)throw new Error("singleton error");
		}
		
		public static function get Instance():NapeController{
			if(!model){
				model = new NapeController;	
			}
			return model;
		}
		
		public function initNape(stage:Stage,sprite:Sprite):void{
			
		}
		
		
		
		
	}
}