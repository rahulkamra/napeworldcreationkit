package worldkit.data
{
	import mx.utils.UIDUtil;

	public class ShapeDO
	{
		public function ShapeDO()
		{
			this.id = UIDUtil.createUID();
		}
		
		public var id:String;
	}
}