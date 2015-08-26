using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Form114.Controllers
{
    public class HomeController : Controller
    {
        private readonly Form114Entities _db = new Form114Entities();
        //TODO Changer la liste à afficher en fonction du nombre de vues
        public ActionResult Index()
        {
            var list = _db.Produits.Take(3).ToList();
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
    }
}