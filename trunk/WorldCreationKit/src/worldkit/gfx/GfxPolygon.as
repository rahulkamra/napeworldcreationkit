package worldkit.gfx
{
	import flash.display.Sprite;
	
	public class GfxPolygon extends Sprite
	{
		public function GfxPolygon(points:Array)
		{
			super();
			this.graphics.lineStyle(3,0x000000,1);
			var commands:Array = convertIntoDrawCommands(points);
			this.graphics.beginFill(0xff2200);
			this.graphics.drawPath(commands[0],commands[1]);
			this.graphics.endFill();
		}
		
		private function convertIntoDrawCommands(points:Array):Array{
			var drawCoords:Vector.<Number> = new Vector.<Number>();
			var drawCommands:Vector.<int> = new Vector.<int>();
			/*drawCoords.push(points[0].x,points[0].y);
			drawCommands.push(1);*/
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
		
		
		public function drawPolygon():void{
			
		}
		
		public static function  drawPolygon():void{
			
		}
		
			
	}
}