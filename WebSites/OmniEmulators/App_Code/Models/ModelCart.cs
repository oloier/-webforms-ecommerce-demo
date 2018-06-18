namespace OmniModels
{
	using System.Collections.Generic;
	using System.Linq;

	public class Cart
	{
		public List<Game> Contents { get; set; }
		public decimal Total
		{
			get
			{
				return Contents.Sum(m => (m.gameprice * m.Quantity));
			}
		}
		public Cart()
		{
			Contents = new List<Game>();
		}

		public void Add(Game gameToAdd)
		{
			// strip out entity descendants for session storage
			gameToAdd.Console = null;
			gameToAdd.Reviews = null;
            Contents.Add(gameToAdd);
		}

		public void Remove(int indexToRemove)
		{
			Contents.RemoveAt(indexToRemove);
		}
	}

}