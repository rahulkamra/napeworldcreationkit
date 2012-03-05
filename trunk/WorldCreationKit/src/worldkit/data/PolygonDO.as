package worldkit.data
{
	public class PolygonDO extends ShapeDO
	{
		public function PolygonDO(points:Array)
		{
			super();
			/*this.points = points;
			this.height = height;*/
			
		}
		
		public var points:Array;
		
		public function get numberOfSides():int{
			throw new Error("Must be overridden");
		}
		
		
	}
}