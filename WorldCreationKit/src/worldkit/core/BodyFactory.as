package worldkit.core
{
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	
	import worldkit.data.BodyDO;

	public class BodyFactory
	{
		public function BodyFactory()
		{
		}
		
		public static function createRectangleBody(data:BodyDO):Body{
			var body:Body 
			
			switch(data.type)
			{
				case BodyDO.STATIC:
				{
					body = new Body(BodyType.STATIC)
					break;
				}
					
				case BodyDO.DYNAMIC:
				{
					body = new Body(BodyType.DYNAMIC)
					break;
				}
					
				case BodyDO.KINEMATIC:
				{
					body = new Body(BodyType.KINEMATIC)
					break;
				}
					
				default:
				{
					throw new Error("Body not found");
					break;
				}
			}
			
			
			var polygon:Polygon =  new Polygon(Polygon.rect(0,0,50,50));;
			body.shapes.add(polygon);
			
			return body;
		}
	}
}