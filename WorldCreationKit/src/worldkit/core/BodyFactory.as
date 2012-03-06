package worldkit.core
{
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	
	import worldkit.data.BodyDO;
	import worldkit.data.PolygonDO;
	import worldkit.data.ShapeDO;

	public class BodyFactory
	{
		public function BodyFactory()
		{
		}
		
		public static function createPolygonBody(data:BodyDO):Body{
			var body:Body = new Body(getBodyType(data.type));
			
			for(var count:int = 0;count < data.shapes.length ; count++){
				var eachObj:ShapeDO = data.shapes[count];
				if(eachObj is PolygonDO){
					addPolygonshape(eachObj as PolygonDO,body);		
				}
			}
			body.position.setxy(data.x,data.y);
			body.align();
			trace(body.position.x)
			trace(body.position.y)
			return body;
		}
		
		private static function addPolygonshape(polygonDO:PolygonDO,body:Body):void{
			var polygon:Polygon =  new Polygon(polygonDO.points);
			trace(polygonDO.points);
			body.shapes.add(polygon);
		}
		
		public static function getBodyType(bodyType:String):BodyType{
			switch(bodyType)
			{
				case BodyDO.STATIC:
				{
					return BodyType.STATIC
					break;
				}
					
				case BodyDO.DYNAMIC:
				{
					return BodyType.DYNAMIC
					break;
				}
					
				case BodyDO.KINEMATIC:
				{
					return BodyType.KINEMATIC
					break;
				}
					
				default:
				{
					throw new Error("Body type not found");
					break;
				}
			}
		}
	}
}