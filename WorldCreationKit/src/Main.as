package
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.ShapeDebug;
	
	
	public class Main extends ResizableSprite
	{

		private var space:Space;
		private var debug:ShapeDebug;
		public function Main()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,addToStage);
		}
		
		protected function addToStage(event:Event):void
		{
			// TODO Auto-generated method stub
			space = new Space(new Vec2(0,600));
			debug = new ShapeDebug(600,600);
			this.addChild(debug.display);
			
			var border:Body = new Body(BodyType.STATIC);
			
			var left:Polygon = new Polygon(Polygon.box(40,800));
			//border.shapes.add(new Polygon(Polygon.box(40,800)));
			border.position.setxy(0,0);
			border.position.setxy(40/2,800/2);
			//border.position.addeq(border.localToRelative(new Vec2(40 / 2, 800 / 2)));
			border.shapes.add(left);
			
			/*border.shapes.add(new Polygon(Polygon.rect(0,0,-40,800)));
			
			border.shapes.add(new Polygon(Polygon.rect(800,0,40,800)));
			border.shapes.add(new Polygon(Polygon.rect(0,0,800,-40)));
			border.shapes.add(new Polygon(Polygon.rect(0,800,800,40)));*/
			
			border.space = space;
			
			
			var block:Polygon = new Polygon(Polygon.box(50,50));
			var body:Body = new Body();
			body.shapes.add(block);
			body.position.setxy(stage.stageWidth/2-100,stage.stageHeight/2);
			body.space = space;
			
			addEventListener(Event.ENTER_FRAME,enterFrame);
			
			
		}		
		
		public function enterFrame(event:Event):void{
			debug.clear();
			space.step(1/stage.frameRate,10,10);
			debug.draw(space);
			debug.flush();
		}
	}
}