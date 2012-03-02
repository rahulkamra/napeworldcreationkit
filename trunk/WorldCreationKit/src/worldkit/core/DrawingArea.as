package worldkit.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.space.Space;
	import nape.util.ShapeDebug;
	
	import worldkit.data.BodyDO;
	
	public class DrawingArea extends Sprite
	{
		
		private var bodyKeyDict:Dictionary = new Dictionary(true);
		private var dataKeyDict:Dictionary = new Dictionary(true);
		
		private var dirtyBodies:Array = new Array;
		public static  var mainDebug:ShapeDebug ;
		private var space:Space;
		public static  var run:Boolean = false
		
		
		public function DrawingArea()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,addedToStage);
			
		}
		
		private function addedToStage(event:Event):void{
			DrawingController.Instance.init(this);
			
			mainDebug = new ShapeDebug(0,0,0xff00ff);
			addChild(mainDebug.display);
			
			space = new Space(new Vec2(0,600));
			
			NapeController.Instance.initNape(stage,this);
			addEventListener(Event.ENTER_FRAME,enterFrame);
			
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
		
		/* Shapes Sync will be added later on */
		private function syncBodyWithData(body:Body,changeShapes:Boolean):void{
			var data:BodyDO = bodyKeyDict[body] as BodyDO;
			body.position.x = data.x;
			body.position.y = data.y;
			
			body.type = BodyFactory.getBodyType(data.type);
			//body. 
			
		}
		
		
		public function pushBody(body:Body,bodyDO:BodyDO):void{
			bodyKeyDict[body] = bodyDO;
			dataKeyDict[bodyDO] = body;
			body.space = this.space;
		}
		
		public function makeBodyDirty(body:Body):void{
			//means sync body with the Data
			dirtyBodies.push(body);
		}
		
		
		
	}
}