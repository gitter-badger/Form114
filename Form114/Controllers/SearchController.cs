﻿using DataLayer.Models;
using Form114.Infrastructure;
using Form114.Infrastructure.SearchProducts;
using Form114.Infrastructure.SearchProducts.Base;
using Form114.Infrastructure.SearchProducts.Options;
using Form114.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Form114.Controllers
{
    public class SearchController : Form114Controller
    {
        public SearchController()
        {
            BCI.Add(new BreadCrumbItem("Search", "Index", "Search"));
        }

        // GET: Search
        public ActionResult Index()
        {
            ViewBag.listeVille = _db.Villes.ToList();
            var svm = new SearchViewModel();
            svm.Ville = new int[10];
            
            return View(svm);
        }

        [HttpPost]
        public ActionResult Result(SearchViewModel svm)
        {
            //var db = new Form114Entities();
            //var liste = db.Produits;
            SearchBase sb = new Search();

            sb = new SearchOptionNombrePlaces(sb, svm.nbPlaces);
            sb = new SearchOptionPrixMini(sb, svm.PrixMini);
            sb = new SearchOptionDateDebut(sb, svm.DateDebut);
            //sb = new SearchOptionRegion(sb, svm.Region);
            sb = new SearchOptionVille(sb, svm.Ville);
            var result = sb.GetResult().ToList();
            ViewBag.PrixMini = svm.PrixMini;
            //int regionId = _db.Villes.Where(v => v.idVille == svm.Ville[0]).Select(v => v.Pays.idRegion).FirstOrDefault();
            //string paysId = _db.Pays.Where(p => p.Regions.idRegion == regionId).Select(p => p.CodeIso3).FirstOrDefault();
            //BCI.Add(new BreadCrumbItem("@regionId", "Result", "Search"));
            return View(result);
        }

        [HttpPost]
        public ActionResult ResultRegion(int id)
        {
            SearchBase sb = new Search();
            string NomRegion = _db.Regions.Find(id).name;
            sb = new SearchOptionRegion(sb, id);
            var result = sb.GetResult().ToList();
            BCI.Add(new BreadCrumbItem( NomRegion, "Result", "Search"));
            return View("Result",result);
        }

        public JsonResult ListeVille()
        {
            var lV = _db.Villes.OrderBy(v => v.name).Select(v => new { id = v.idVille, name = v.name });
            var liste = lV.ToList();
            return Json(lV, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListeVille1(string id)
        {
            var lV = _db.Villes.Where( v => v.Pays.CodeIso3 == id).OrderBy(v => v.name).Select(v => new { id = v.idVille, name = v.name });
            var liste = lV.ToList();
            return Json(lV, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListeRegion()
        {
            var lR = _db.Regions.OrderBy(r => r.name).Select(r => new { id = r.idRegion, name = r.name });
            return Json(lR, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListePays(string id)
        {
            var ID = Convert.ToInt16(id);
            var lR = _db.Pays.Where(r => r.idRegion == ID).OrderBy(r => r.Name).Select(r => new { id = r.CodeIso3, name = r.Name });
            var result = lR.ToList();
            return Json(lR, JsonRequestBehavior.AllowGet);
        }
    }
}