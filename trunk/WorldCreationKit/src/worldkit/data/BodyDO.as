package worldkit.data
{
	import nape.phys.BodyType;

	public class BodyDO
	{
		public function BodyDO(x:int,y:int,type:String = null)
		{
			this.x = x;
			this.y = y;
			
			if(!type)
				this.type = STATIC;
			else
				this.type = type; 
			
		}
		
		public static var STATIC:String = "Static";
		public static var DYNAMIC:String = "Dynamic";
		public static var KINEMATIC:String = "Kinematic";
		
		public var x:Number = 0;
		public var y:Number= 0;
		public var type:String = STATIC;
		public var shapes:Vector.<ShapeDO> = new Vector.<ShapeDO>();
	}
}
