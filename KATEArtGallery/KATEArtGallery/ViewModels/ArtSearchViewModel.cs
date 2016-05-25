using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KATEArtGallery.ViewModels
{
    public class ArtSearchViewModel
    {
        public int ArtWorkId { get; set; }
        public int ArtistId { get; set; }
        public string Name { get; set; }
        public string Medium { get; set;}
        public decimal Price { get; set; }
        public List<ArtSearch> ArtSearch { get; set; }
    }
}