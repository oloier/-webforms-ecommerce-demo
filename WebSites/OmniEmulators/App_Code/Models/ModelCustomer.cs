namespace OmniModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            Reviews = new HashSet<Review>();
        }

        [Key]
        public int custid { get; set; }

        [Required]
        [StringLength(50)]
        public string custfirstname { get; set; }

        [Required]
        [StringLength(50)]
        public string custlastname { get; set; }

        [Column(TypeName = "date")]
        public DateTime custdob { get; set; }

        [Required]
        [StringLength(50)]
        public string custemail { get; set; }

        [Required]
        [StringLength(15)]
        public string custphone { get; set; }

        [Required]
        [StringLength(50)]
        public string custaddress1 { get; set; }

        [StringLength(50)]
        public string custaddress2 { get; set; }

        [Required]
        [StringLength(50)]
        public string custcity { get; set; }

        [Required]
        [StringLength(20)]
        public string custstate { get; set; }

        [Required]
        [StringLength(10)]
        public string custzip { get; set; }

        [Column(TypeName = "text")]
        public string custaddlnotes { get; set; }

        [StringLength(50)]
        public string custusername { get; set; }

        [DataType(DataType.Password)]
        public string custpassword { get; set; }

        public bool custadmin { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }

    }

}