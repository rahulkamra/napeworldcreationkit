package worldkit.gfx
{
	import flash.events.MouseEvent;
	
	import worldkit.core.MouseInteractionController;
	import worldkit.core.ui.CircleDot;
	import worldkit.data.BodyDO;
	import worldkit.data.RectangleDO;
	
	public class GfxRectangle extends GfxElement
	{
		private var rectagleDO:RectangleDO;
		public function GfxRectangle(bodyDO:BodyDO)
		{
			super(bodyDO);
			rectagleDO = bodyDO.shapes[0] as RectangleDO;
		}
		
		override public function changeSize(width:int,height:int):void{
			
			this.mainContainer.graphics.clear();
			var points:Array = GraphicFactory.drawRectangle(0,0,width,height,this.mainContainer)[1];
			rectagleDO.points = points;
				// (rectagleDO.points,mainContainer);
			super.changeSize(width,height);
		}
		
		
		
	}
}