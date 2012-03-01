package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	public class ResizableSprite extends Sprite
	{
		public function ResizableSprite()
		{
			//super();
		}
		
		
		public function setDimention(width:Number,height:Number):void{
			this.graphics.clear();
			this.graphics.beginFill( 0xffffff, 1.0 );
			this.graphics.drawRect(0,0,width,height);	
			this.graphics.endFill();
		}
		
	}
}