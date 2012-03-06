package
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.FlexGlobals;
	import mx.utils.ObjectUtil;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyList;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.shape.Shape;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import nape.util.ShapeDebug;
	
	import worldkit.core.BodyFactory;
	import worldkit.data.BodyDO;
	import worldkit.data.PolygonDO;
	import worldkit.data.ShapeDO;
	
	
	public class Main extends ResizableSprite
	{

		private var space:Space;
		private var phyDebug:ShapeDebug;
		public function Main()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,addToStage);
		}
		
		protected function addToStage(event:Event):void
		{
			// TODO Auto-generated method stub
			space = new Space(new Vec2(0,600));
			
			phyDebug = new ShapeDebug(1000,1000,0xffffff);
			this.addChild(phyDebug.display);
			
			// TODO Auto-generated method stub
			
			
			var bodyDO:BodyDO = new BodyDO(500,0,BodyDO.DYNAMIC);
			
			var shapes:Vector.<ShapeDO> = new Vector.<ShapeDO>();
			//shapes.push(new PolygonDO(50,50));
			//bodyDO.shapes = shapes;
			
			var body:Body = BodyFactory.createPolygonBody(bodyDO)
			body.space = space;
			
			
			
			var border:Body = new Body(BodyType.STATIC);
			var left:Polygon = new Polygon(Polygon.box(40,800));
			//border.shapes.add(new Polygon(Polygon.box(40,800)));
			//border.position.setxy(40/2,800/2);
			//border.position.addeq(border.localToRelative(new Vec2(40 / 2, 800 / 2)));
			border.shapes.add(left);
			
			border.shapes.add(new Polygon(Polygon.rect(0,0,40,800)));
			
			//border.shapes.add(new Polygon(Polygon.rect(800,0,40,800)));
			//border.shapes.add(new Polygon(Polygon.rect(0,0,800,-40)));
			//border.shapes.add(new Polygon(Polygon.rect(0,800,800,40)));
			
			border.space = space;
			
			
			var block:Polygon = new Polygon(Polygon.rect(0,0,50,50));
			
			
			var body1:Body = new Body(BodyType.DYNAMIC);
			body1.shapes.add(block);
			body1.position.x=100;
			body1.position.y=100;
			//body.position.setxy(stage.stageWidth/2-100,stage.stageHeight/2);
			body1.space = space;
			//debug.
			stage.addEventListener(MouseEvent.CLICK,function click():void{
				var mp:Vec2 = new Vec2(mouseX,mouseY);
				var list:BodyList = space.bodiesUnderPoint(mp)
				trace("Hello!!",list);
				
				for(var b:Object in space.bodiesUnderPoint(mp)) {
					trace(b);
					
				}
			});
			
			addEventListener(Event.ENTER_FRAME,enterFrame);
			
		}		
		
		public function enterFrame(event:Event):void{
			phyDebug.clear();
			space.step(1/stage.frameRate,10,10);
			phyDebug.draw(space);
			phyDebug.flush();
			trace(phyDebug.display.width)
		}
	}
}