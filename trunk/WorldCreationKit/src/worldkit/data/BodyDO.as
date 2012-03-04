package worldkit.data
{
	import nape.phys.BodyType;

	[Bindable]
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
		
		public static const STATIC:String = "Static";
		public static const DYNAMIC:String = "Dynamic";
		public static const KINEMATIC:String = "Kinematic";
		
		public var x:Number = 0;
		public var y:Number= 0;
		public var type:String = STATIC;
		public var shapes:Vector.<ShapeDO> = new Vector.<ShapeDO>();
	}
}
