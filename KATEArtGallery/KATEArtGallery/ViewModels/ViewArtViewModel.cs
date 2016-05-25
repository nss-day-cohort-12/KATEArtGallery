using KATEArtGallery.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KATEArtGallery.ViewModels
{
    public class ViewArtViewModel
    {
        public decimal Price { get; set; }
        public string Dimensions { get; set; }
        public int NumberInInventory { get; set; }
        public string Location { get; set; }
        public int ArtWorkId { get; set; }
        public int ArtistId { get; set; }
        public int IndividualPieceId { get; set; }
        public string Title { get; set; }
        public string WebURL { get; set; } 
        public string Category { get; set; } 
        public string Medium { get; set; }
        public List<IndividualPiece> IndividualPiece { get; set; }
    }
}