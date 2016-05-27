using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KATEArtGallery.Models
{
    public class ArtWork
    {
        public int ArtWorkId { get; set; }
        public int ArtistId { get; set; }
        public string Title { get; set; }
        public string Category { get; set; }
        public int YearOriginalCreated { get; set; }
        public string Medium { get; set; }
        public string Dimensions { get; set; }
        public string NumberMade { get; set; }
        public int NumberInInventory { get; set; }
        public int NumberSold { get; set; }
        //public List<ArtWork> Artwork { get; set; }
        
        public virtual ICollection<Artist> Artists { get; set; }
    }
}