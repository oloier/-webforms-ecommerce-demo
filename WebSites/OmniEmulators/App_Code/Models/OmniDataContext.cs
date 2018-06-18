namespace OmniModels
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class OmniContext : DbContext
    {
        public OmniContext()
            : base("name=OmniDataContext")
        {
        }

        public virtual DbSet<Console> Consoles { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Game> Games { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Sale> Sales { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Console>()
                .Property(e => e.consolename)
                .IsUnicode(false);

            modelBuilder.Entity<Console>()
                .Property(e => e.consolecompany)
                .IsUnicode(false);

            modelBuilder.Entity<Console>()
                .Property(e => e.consoleresolution)
                .IsUnicode(false);

            modelBuilder.Entity<Console>()
                .HasMany(e => e.Games)
                .WithRequired(e => e.Console)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custfirstname)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custlastname)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custemail)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custphone)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custaddress1)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custaddress2)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custcity)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custstate)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custzip)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.custaddlnotes)
                .IsUnicode(false);

            modelBuilder.Entity<Game>()
                .Property(e => e.gametitle)
                .IsUnicode(false);

            modelBuilder.Entity<Game>()
                .Property(e => e.gameyear)
                .IsUnicode(false);

            modelBuilder.Entity<Game>()
                .Property(e => e.gamegenre)
                .IsUnicode(false);

            modelBuilder.Entity<Game>()
                .Property(e => e.gamecompany)
                .IsUnicode(false);

            modelBuilder.Entity<Game>()
                .Property(e => e.gameprice)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Game>()
                .HasMany(e => e.Reviews)
                .WithRequired(e => e.Game)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Review>()
                .Property(e => e.reviewnotes)
                .IsUnicode(false);
        }
    }
}