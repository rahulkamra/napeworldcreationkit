package worldkit.gfx
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import worldkit.data.PolygonDO;
	
	public class GfxPolygon extends Sprite
	{
		
		private var polygonDO:PolygonDO;
		public function GfxPolygon()
		{
			super();
			polygonDO = new PolygonDO();
			addEventListener(Event.ENTER_FRAME,enterFrame);
		}
		
		private function enterFrame(event:Event):void{
			syncData();	
		}
		
		protected function syncData():void{
			//data.points = 	
		}
		
		
		public function createFromPoints(points:Array):void{
			GraphicFactory.drawPolygon(points,this);	
		}
		
		public function get data():PolygonDO{
			return this.polygonDO;	
		}
		
		
			
	}
}