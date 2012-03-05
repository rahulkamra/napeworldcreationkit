package worldkit.data
{
	public class RectangleDO extends PolygonDO
	{
		public function RectangleDO(width:Number, height:Number)
		{
			super(width, height);
		}
		
		public function get numberOfSides():int{
			return 4;
		}
	}
}