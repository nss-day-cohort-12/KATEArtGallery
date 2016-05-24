using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KATEArtGallery.Models
{
    public class IndividualPiece
    {
        public int IndividualPieceId { get; set; }
        public int ArtWorkId { get; set; }
        public string Image { get; set; }
        public DateTime DateCreated { get; set; }
        public double Cost { get; set; }
        public double Price { get; set; }
        public int Sold { get; set; }
        public string Location { get; set; }
        public int EditionNumber { get; set; }
    }
}