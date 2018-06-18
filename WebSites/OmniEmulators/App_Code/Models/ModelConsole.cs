namespace OmniModels
{
	using System;
	using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Data.Entity.Spatial;

	[Table("Console")]
	public partial class Console
	{
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
		public Console()
		{
			Games = new HashSet<Game>();
		}

		public int consoleid { get; set; }

		[Required]
		[StringLength(50)]
		public string consolename { get; set; }

		[Required]
		[StringLength(50)]
		public string consolecompany { get; set; }

		public int consoleyear { get; set; }

		public int consolecontrollers { get; set; }

		[Required]
		[StringLength(50)]
		public string consoleresolution { get; set; }

		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
		public virtual ICollection<Game> Games { get; set; }
	}
}