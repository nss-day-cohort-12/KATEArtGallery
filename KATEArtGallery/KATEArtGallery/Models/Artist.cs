﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KATEArtGallery.Models
{
    public class Artist
    {
        public int ArtistId { get; set; }
        public string Name { get; set; }
        public int BirthYear { get; set; }
        public int DeathYear { get; set; }
    }
}