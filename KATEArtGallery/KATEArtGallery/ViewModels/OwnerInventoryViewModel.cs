using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KATEArtGallery.ViewModels
{
    public class OwnerInventoryViewModel
    {
       public int IndividualPieceId { get; set; }
       public int ArtWorkId { get; set; }
       public int InvoiceId { get; set; }
       public decimal Cost { get; set; }
       public decimal Price { get; set; }
       public int Sold { get; set; }
       public string PieceSold { get; set; }
       public decimal Profit { get; set; } 
       public decimal WeeklyProfit { get; set; }
       public decimal MonthlyProfit { get; set; }
       public decimal AnnualProfit { get; set; }    
       public decimal WeeklySales { get; set; }
       public decimal MonthlySales { get; set; }
       public decimal AnnualSales { get; set; }
       public List<OwnerInventory> OwnerInventory { get; set; } 
               
    }
}