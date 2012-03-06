package worldkit.gfx
{
	import flash.display.Sprite;
	
	import nape.shape.Polygon;
	
	import worldkit.data.RectangleDO;

	public class GraphicFactory
	{
		public function GraphicFactory()
		{
		}
		
		public static function drawRectangle(x:int,y:int,width:Number,height:Number,sprite:Sprite = null):Array{
			if(!sprite)sprite = new Sprite();
			var points:Array = PhysicsFactory.getRectanglePoints(x,y,width,height);
			drawPolygon(points,sprite);
			return [sprite,points];
		}
		
		public static function drawPolygon(points:Array,sprite:Sprite = null):Sprite{
			if(!sprite)sprite = new Sprite();
			sprite.graphics.lineStyle(0,0x000000,1);
			var commands:Array = convertIntoDrawCommands(points);
			
			sprite.graphics.beginFill(0xff2200,0.5);
			sprite.graphics.drawPath(commands[0],commands[1]);
			sprite.graphics.endFill();
			return sprite;
		}
		
		
		
		
		
		private static function convertIntoDrawCommands(points:Array):Array{
			var drawCoords:Vector.<Number> = new Vector.<Number>();
			var drawCommands:Vector.<int> = new Vector.<int>();
			
			drawCoords.push(points[0].x,points[0].y);
			drawCommands.push(1);
			for(var count:int = 0 ; count < points.length ; count++){
				if(count+1 == points.length){
					drawCoords.push(points[0].x,points[0].y);
					drawCommands.push(2);
				}else{
					drawCoords.push(points[count+1].x,points[count+1].y);
					drawCommands.push(2);
				}
			}
			
			return [drawCommands,drawCoords];
		}
		
	}
}