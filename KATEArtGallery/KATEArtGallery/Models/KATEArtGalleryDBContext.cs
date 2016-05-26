using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace KATEArtGallery.Models
{
    public class KATEArtGalleryDBContext : DbContext
    {
        public DbSet<Agent> Agent { get; set; }
        public DbSet<Artist> Artist { get; set; }
        public DbSet<ArtShow> ArtShow { get; set; }
        public DbSet<ArtWork> Artwork { get; set; }
        public DbSet<Customer> Customer { get; set; }
        public DbSet<IndividualPiece> IndividualPiece { get; set; }
        public DbSet<Invoice> Invoice { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Agent>()
                .ToTable("Agent")
                .HasKey(c => c.AgentId);

            modelBuilder.Entity<Artist>()
                .ToTable("Artist")
                .HasKey(c => c.ArtistId);

            modelBuilder.Entity<ArtShow>()
                .ToTable("ArtShow")
                .HasKey(c => c.ArtShowId);

            modelBuilder.Entity<ArtWork>()
                .ToTable("Artwork")
                .HasKey(c => c.ArtWorkId);

            modelBuilder.Entity<Customer>()
                .ToTable("Customer")
                .HasKey(c => c.CustomerId);

            modelBuilder.Entity<IndividualPiece>()
                .ToTable("IndividualPiece")
                .HasKey(c => c.IndividualPieceId);

            modelBuilder.Entity<Invoice>()
                .ToTable("Invoice")
                .HasKey(c => c.InvoiceId);
        }
    }
}