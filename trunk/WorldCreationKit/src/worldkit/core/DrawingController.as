package worldkit.core
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import mx.core.FlexGlobals;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	
	import worldkit.data.BodyDO;
	import worldkit.gfx.GfxPolygon;

	public class DrawingController
	{
		private static var model:DrawingController;
		public function DrawingController()
		{
			if(model != null)throw new Error("singleton error");
		}
		
		public static function get Instance():DrawingController{
			if(!model){
				model = new DrawingController;	
			}
			return model;
		}
		
		private var drawingArea:Sprite;
		public function init(area:Sprite):void{
			this.drawingArea = area;
		}
		
		public function addRectangularBody(data:BodyDO):void{
			var body:Body = BodyFactory.createRectangleBody(data); 
			body.position.x = data.x;
			body.position.y = data.y;
			body.space = NapeController.Instance.space;
		}
	}
}