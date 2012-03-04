package worldkit.core
{
	import flash.display.Sprite;
	
	import mx.core.FlexGlobals;
	
	import nape.phys.Body;

	public class HighlightController
	{
		private static var model:HighlightController; 
		
		public static function get Instance():HighlightController{
			if(!model)
				model = new HighlightController();
			
			return model;
		}
		
		public function HighlightController()
		{
			if(model){
				throw new Error("Singleton error");
			}
			
		}
		
		private var circlesArray:Array = new Array;
		
		public function createHighlighter(body:Body):void{
			
			if(circlesArray.length == 0){
				initSprite();
			}
			
			(circlesArray[0] as Sprite).x = body.position.x - body.bounds.width/2;
			(circlesArray[0] as Sprite).y = body.position.y - body.bounds.height/2;
			//trace((circlesArray[0] as Sprite).x);
		}
		
		public function removeHighlighter():void{
			
		}
		
		private function initSprite():void{
			var sprite:Sprite = new Sprite();
			
			// create 6 small circles
			
			var firstCircle:Sprite = new Sprite();
			firstCircle.graphics.lineStyle(1);
			firstCircle.graphics.beginFill(0xff2200);
			firstCircle.graphics.drawCircle(0,0,5);
			firstCircle.graphics.endFill();
			circlesArray.push(firstCircle);
			DrawingArea.Instance.addChild(circlesArray[0] as Sprite);
		}

	}
}