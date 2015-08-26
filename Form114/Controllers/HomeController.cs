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
        public ActionResult Index()
        {
            return View();
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

            Form114Entities DbConnection = new Form114Entities();
            int comptageProduits = DbConnection.Produits.Select(x => x.IdProduit).Count();
            int comptageAcheteurs = DbConnection.Utilisateurs.Select(x => x.IdUtilisateur).Count();
            int[] listComptage = new int[2]{comptageProduits, comptageAcheteurs};

            return PartialView("_Comptage", listComptage);
        }
    }
}