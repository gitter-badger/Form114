using DataLayer.Models;
using Form114.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Form114.Controllers
{
    public class HomeController : Form114Controller
    {
        //TODO Changer la liste à afficher en fonction du nombre de vues
        public ActionResult Index()
        {
            var list = _db.Produits.Take(3).ToList();
            //var listCatalog = _db.Regions.Take(4).ToList();
            ViewBag.listRegions = _db.Regions.Take(4).ToList();
            return View(list);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [ChildActionOnly]
        public PartialViewResult Comptage()
        {
            // TODO faire le comptage des Acheteurs, creer la table "Identities"
            int comptageProduits = _db.Produits.Select(x => x.IdProduit).Count();
            int comptageAcheteurs = _db.AspNetUsers.Select(x => x.Id).Count();
            int[] listComptage = new int[2]{comptageProduits, comptageAcheteurs};

            return PartialView("_Comptage", listComptage);
        }

        [ChildActionOnly]
        public PartialViewResult Catalog(int id) {
            var item = _db.Produits.Find(id).Villes.Pays.CodeIso2;
            return PartialView("_Catalog", _db.Regions.Find(id));
        }
    }
}