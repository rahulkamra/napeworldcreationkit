package worldkit.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import flashx.textLayout.tlf_internal;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyList;
	import nape.space.Space;
	import nape.util.ShapeDebug;
	
	import worldkit.data.BodyDO;
	
	public class DrawingArea extends Sprite
	{
		
		public var bodyKeyDict:Dictionary = new Dictionary(true);
		public var dataKeyDict:Dictionary = new Dictionary(true);
		
		private var dirtyBodies:Array = new Array;
		public var space:Space;
		private static var model:DrawingArea; 
		public  var mainDebug:ShapeDebug ;
		public  var run:Boolean = false
		
		
		public function DrawingArea()
		{
			super();
			
			if(model){
				throw new Error("Singleton error");
			}
			
			addEventListener(Event.ADDED_TO_STAGE,addedToStage);
			
		}
		
		public static function get Instance():DrawingArea{
			if(!model)
				model = new DrawingArea();
			return model;
		}
		private function addedToStage(event:Event):void{
			DrawingController.Instance.init(this);
			
			mainDebug = new ShapeDebug(0,0,0xff00ff);
			addChild(mainDebug.display);
			
			space = new Space(new Vec2(0,600));
			
			addEventListener(Event.ENTER_FRAME,enterFrame);
			MouseInteractionController.Instance;
		}
		
		protected function enterFrame(event:Event):void
		{
			mainDebug.clear();
			if(run){
				space.step(1/stage.frameRate,10,10);
			}
			mainDebug.draw(space);
			mainDebug.flush();
			syncAllBodies();
		}
		
		private function syncAllBodies():void
		{
			// TODO Auto Generated method stub
			for(var count:int = 0 ; count < dirtyBodies.length; count++){
				makeBodyClean(dirtyBodies[count] as Body);
			}
				
			
		}		
		
		/* Shapes Sync will be added later on */
		private function syncBodyWithData(body:Body,changeShapes:Boolean):void{
			var data:BodyDO = bodyKeyDict[body] as BodyDO;
			trace(data.x,body.position.x)
			body.position.x = data.x;
			body.position.y = data.y;
			
			body.type = BodyFactory.getBodyType(data.type);
			//body. 
			mainDebug.clear();
			mainDebug.draw(space);
			mainDebug.flush();
		}
		
		
		public function pushBody(body:Body,bodyDO:BodyDO):void{
			bodyKeyDict[body] = bodyDO;
			dataKeyDict[bodyDO] = body;
			body.space = this.space;
			trace(body.position.x , bodyDO.x);
		}
		
		public function makeBodyDirty(body:Body):void{
			//means sync body with the Data
			dirtyBodies.push(body);
		}

		public function makeBodyClean(body:Body):void{
			//means sync body with the Data
			syncBodyWithData(body,false);
			//dirtyBodies.
		}
		public function makeEverythingClean():void{
			dirtyBodies = new Array();
		}
		
		
		
	}
}