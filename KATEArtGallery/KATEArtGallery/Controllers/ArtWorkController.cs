using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATEArtGallery.Models;
using KATEArtGallery.ViewModels;

namespace KATEArtGallery.Controllers
{
    public class ArtWorkController : Controller
    {
        // GET: ArtWork
        public ActionResult ViewArt()
        {
            KATEArtGalleryDBContext _allArtistContext = new KATEArtGalleryDBContext();

            List<Artist> artistDetails = _allArtistContext.Artist.ToList();
            //select new ArtWork
            //{
            //    Title = art.Title,
            //    //EmployeeId = emp.EmployeeId,
            //    //DepartmentName = dept.DepartmentName
            //}).ToList();

            return View(artistDetails);
        }
    }
}