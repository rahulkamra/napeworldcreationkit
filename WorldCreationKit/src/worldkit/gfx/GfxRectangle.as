package worldkit.gfx
{
	import worldkit.data.RectangleDO;

	public class GfxRectangle extends GfxPolygon
	{
		private var rectangleDO:RectangleDO;
		
		public function GfxRectangle()
		{
			rectangleDO = new RectangleDO();
		}
		
		override public function get data():RectangleDO{
			return this.rectangleDO;	
		}
		
		override protected function syncData():void{
			
		}
		
		
		public function createFromDimention(x:int,y:int,width:int,height:int):void{
			rectangleDO.points = GraphicFactory.drawRectangle(x,y,width,height,this)[1] as Array;
		}
		
	}
}