﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATEArtGallery.Models;

namespace KATEArtGallery.Controllers
{
    public class ArtworkController : Controller
    {
        // GET: Artwork
        public ActionResult ViewArtwork()
        {
            KATEArtGalleryDBContext _allArtContext = new KATEArtGalleryDBContext();

            List<ArtWork> artworkDetails = _allArtContext.Artwork.ToList();
            //select new ArtWork
            //{
            //    Title = art.Title,
            //    //EmployeeId = emp.EmployeeId,
            //    //DepartmentName = dept.DepartmentName
            //}).ToList();

            return View(artworkDetails);
        }
    }
}