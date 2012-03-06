package worldkit.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.ShapeDebug;
	
	import worldkit.data.BodyDO;
	import worldkit.data.ShapeDO;
	import worldkit.data.WorldDO;
	
	public class RunWorld extends Sprite
	{
		public var space:Space;
		public  var mainDebug:ShapeDebug ;
		public  var run:Boolean = true;
		private var worldDO:WorldDO;

		public function RunWorld(world:WorldDO)
		{
			super();
			this.worldDO = world;
			addEventListener(Event.ADDED_TO_STAGE,addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE,removeFromStage)
		}
		
				
		
		private function initWorld():void{
			for(var count:int = 0 ; count < worldDO.bodies.length ; count++){
				var eachBody:BodyDO = worldDO.bodies[count];
				addBody(eachBody);
			}
		}
		
		public function addBody(bodyDO:BodyDO):void{
			var body:Body = BodyFactory.createPolygonBody(bodyDO);
			body.space = space;
		}
		
		private function addedToStage(event:Event):void{
			mainDebug = new ShapeDebug(1000,1000,0xff00ff);
			addChild(mainDebug.display);
			
			space = new Space(new Vec2(0,600));
			addEventListener(Event.ENTER_FRAME,enterFrame);
			
			/*
			 * 
			*/
			
			initWorld();
		}
		protected function removeFromStage(event:Event):void
		{
			// TODO Auto-generated method stub
			removeEventListener(Event.ENTER_FRAME,enterFrame);
		}
		
		
		protected function enterFrame(event:Event):void
		{
			mainDebug.clear();
			if(run){
				space.step(1/stage.frameRate,10,10);
			}
			mainDebug.draw(space);
			mainDebug.flush();
		}
		
	}
}