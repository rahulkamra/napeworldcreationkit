package worldkit.gfx
{
	import flash.display.Sprite;
	
	import nape.shape.Polygon;
	
	import worldkit.data.BodyDO;
	import worldkit.data.RectangleDO;
	import worldkit.data.ShapeDO;

	public class PhysicsFactory
	{
		public function PhysicsFactory()
		{
		}
		
		public static function createGraphicFromBody(bodyDO:BodyDO):GfxElement{
			var sprite:GfxElement = new GfxElement(bodyDO);
			sprite.x = bodyDO.x;
			sprite.y = bodyDO.y;
			
			for(var count:int = 0 ; count < bodyDO.shapes.length;count++){
				var eachShape:ShapeDO = bodyDO.shapes[count];
				if(eachShape is RectangleDO){
					addRectangle(sprite,eachShape as RectangleDO);
				}
			} 
			return sprite;
		}
		
		public static function getRectanglePoints(x:int,y:int,width:Number,height:Number):Array{
			return Polygon.rect(x,y,width,height)
		}
		
		private static function addRectangle(gfxElement:GfxElement,shape:RectangleDO):void{
			GraphicFactory.drawPolygon(shape.points,gfxElement);
		}
		
	}
}