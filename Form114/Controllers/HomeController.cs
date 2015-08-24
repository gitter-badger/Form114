using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Form114.Controllers {
    public class HomeController : Controller {
        public ActionResult Index() {
            return View();
        }

        public ActionResult About() {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact() {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        //[ChildActionOnly]
        //public PartialViewResult Comptage()
        //{
        //    Form114Entities DbConnection = new Form114Entities();
        //    int comptageProduits = DbConnection.Produits.Count();

        //    return PartialView("_Comptage", comptageProduits);
        //}
    }
}