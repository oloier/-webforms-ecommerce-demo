namespace OmniModels
{

	using System;
	using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Data.Entity.Spatial;

	[Table("Game")]
	public partial class Game
	{
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Game()
        {
            Reviews = new HashSet<Review>();
        }

		public int gameid { get; set; }

		[StringLength(25)]
		public string gametitle { get; set; }

		public int consoleid { get; set; }

		[StringLength(4)]
		public string gameyear { get; set; }

		[StringLength(25)]
		public string gamegenre { get; set; }

		[StringLength(25)]
		public string gamecompany { get; set; }

		public int? gamenumplayers { get; set; }

		public decimal gameprice { get; set; }

		public virtual Console Console { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }


        [NotMapped]
		public int Quantity { get; set; }
		[NotMapped]
		public string Price
		{
			get
			{
				return String.Format("{0:C}", gameprice);
			}
		}
		[NotMapped]
		public string Subtotal
		{
			get
			{
				var totes = gameprice * Quantity;
				return String.Format("{0:C}", totes);
			}
		}
	}

}
