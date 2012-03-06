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
			var sprite:GfxElement
			if(bodyDO.shapes.length == 1){
				//means special figueres
				var shape:ShapeDO = bodyDO.shapes[0];
				if(shape is RectangleDO){
					sprite = new GfxRectangle(bodyDO);
					addRectangle(sprite,shape as RectangleDO);
				}
			}else{
				sprite = new GfxElement(bodyDO)
				for(var count:int = 0 ; count < bodyDO.shapes.length;count++){
					var eachShape:ShapeDO = bodyDO.shapes[count];
					if(eachShape is RectangleDO){
						addRectangle(sprite,eachShape as RectangleDO);
					}
				} 
			}
			
			if(sprite == null){
				//means sprite not defined
				throw new Error("New Entity");
			}
			
			sprite.x = bodyDO.x;
			sprite.y = bodyDO.y;
			
			
			return sprite;
		}
		
		public static function getRectanglePoints(x:int,y:int,width:Number,height:Number):Array{
			return Polygon.rect(x,y,width,height)
		}
		
		private static function addRectangle(gfxElement:GfxElement,shape:RectangleDO):void{
			GraphicFactory.drawPolygon(shape.points,gfxElement.mainContainer);
		}
		
	}
}