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
	import worldkit.data.PolygonDO;
	import worldkit.data.ShapeDO;
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
		
		private var drawingArea:DrawingArea;
		public function init(area:DrawingArea):void{
			this.drawingArea = area;
		}
		
		public function addPlygonBody(data:BodyDO):void{
			var body:Body = BodyFactory.createPolygonBody(data); 
			drawingArea.pushBody(body,data);
		}
	}
}