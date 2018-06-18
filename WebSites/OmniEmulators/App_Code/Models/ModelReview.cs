namespace OmniModels
{

	using System;
	using System.Collections.Generic;
	using System.ComponentModel.DataAnnotations;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Data.Entity.Spatial;

	[Table("Review")]
	public partial class Review
	{
        public int reviewid { get; set; }

        public int gameid { get; set; }

        public int reviewrating { get; set; }

        public DateTime? reviewdate { get; set; }

        [Required]
        public string reviewnotes { get; set; }

        public int custid { get; set; }

        public virtual Game Game { get; set; }

        public virtual Customer Customer { get; set; }


    }
}