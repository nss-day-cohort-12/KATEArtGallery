using KATEArtGallery.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KATEArtGallery.ViewModels
{
    public class AgentViewModel
    {
        public int AgentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int InvoiceId { get; set; }
        public decimal Price { get; set; }
        public string PieceSold { get; set; }
        public int Sold { get; set; }
        public decimal AgentSales { get; set; }
        public decimal AgentProfits { get; set; }
        public List<Agent> Agent { get; set; }

    }
}