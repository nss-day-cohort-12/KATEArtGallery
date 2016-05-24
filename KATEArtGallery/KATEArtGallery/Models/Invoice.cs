using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KATEArtGallery.Models
{
    public class Invoice
    {
        public int InvoiceId { get; set; }
        public int CustomerId { get; set; }
        public int AgentId { get; set; }
        public string PaymentMethod { get; set; }
        public string ShippingAddress {get; set;}
        public string PieceSold { get; set; }
        public decimal Price { get; set; }

    }
}