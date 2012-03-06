package worldkit.data
{
	public class RectangleDO extends PolygonDO
	{
		public function RectangleDO(points:Array)
		{
			super(points);
		}
		
		override public function get numberOfSides():int{
			return 4;
		}
	}
}