using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATEArtGallery.Models;
using System.Net;
using System.Data;

namespace KATEArtGallery.Controllers
{
    public class ArtworkController : Controller
    {
        // GET: Artwork
        public ActionResult ViewArtwork()
        {
            KATEArtGalleryDBContext _allArtContext = new KATEArtGalleryDBContext();

            List<ArtWork> artworkDetails = _allArtContext.Artwork.ToList();

            return View(artworkDetails);
        }

        // GET 
        // [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost] // must be here for page to work
        public ActionResult Create(ArtWork artworkDetails)
        {
            using (KATEArtGalleryDBContext _context = new KATEArtGalleryDBContext())
            {
                if (ModelState.IsValid)
                {
                    ArtWork artwork = new ArtWork
                    {
                        Title = artworkDetails.Title,
                        Category = artworkDetails.Category,
                        YearOriginalCreated = artworkDetails.YearOriginalCreated,
                        Medium = artworkDetails.Medium,
                        Dimensions = artworkDetails.Dimensions,
                        NumberMade = artworkDetails.NumberMade,
                        NumberInInventory = artworkDetails.NumberInInventory,
                        NumberSold = artworkDetails.NumberSold
                    };
                    _context.Artwork.Add(artwork);
                    _context.SaveChanges();
                    return RedirectToAction("ViewArtwork");
                }
                return View(artworkDetails);
            }
        }

        public ActionResult Delete(int artworkId)
        {
            if (artworkId != 0)
            {
                using (KATEArtGalleryDBContext _context = new KATEArtGalleryDBContext())
                {
                    ArtWork artwork = _context.Artwork.Find(artworkId);

                    _context.Artwork.Remove(artwork);
                    _context.SaveChanges();

                }
            }
            else
            {
                ViewBag.Title = "There was a problem";
            }
            return RedirectToAction("Index");
        }

        //public ActionResult Delete(int? ArtWorkId, bool? saveChangesError = false)
        //{
        //    using (KATEArtGalleryDBContext _context = new KATEArtGalleryDBContext())
        //    {
        //        ArtWork artwork = _context.Artwork.Find(ArtWorkId);
        //        if (ArtWorkId == null)
        //        {
        //            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //        }
        //        if (saveChangesError.GetValueOrDefault())
        //        {
        //            ViewBag.ErrorMessage = "Delete failed. Try again, and if the problem persists see your system administrator.";
        //        }

        //            if (ArtWorkId == null)
        //            {
        //                return HttpNotFound();
        //            }
        //        return View(artwork);
        //    }
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Delete(int ArtWorkId)
        //{
        //    using (KATEArtGalleryDBContext _context = new KATEArtGalleryDBContext())
        //    {
        //        ArtWork artwork = _context.Artwork.Find(ArtWorkId);
        //        try
        //        {
        //            _context.Artwork.Remove(artwork);
        //            _context.SaveChanges();
        //        }
        //        catch (DataException/* dex */)
        //        {
        //            //Log the error (uncomment dex variable name and add a line here to write a log.
        //            return RedirectToAction("Delete", new { artworkId = ArtWorkId, saveChangesError = true });
        //        }
        //        return RedirectToAction("ViewArtwork");
        //    }
        //}


    }
}