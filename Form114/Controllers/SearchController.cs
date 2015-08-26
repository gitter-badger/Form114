using DataLayer.Models;
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
    public class SearchController : Controller
    {
        // GET: Search
        public ActionResult Index()
        {
            var db = new Form114Entities();
            ViewBag.listeVille = db.Villes.ToList();
            var svm = new SearchViewModel();
            svm.Ville = new int[10];
            return View(svm);
        }

        public ActionResult Result(SearchViewModel svm)
        {
            //var db = new Form114Entities();
            //var liste = db.Produits;
            SearchBase sb = new Search();
            sb = new SearchOptionVille(sb, svm.Ville);
            sb = new SearchOptionNombrePlaces(sb, svm.nbPlaces);
            sb = new SearchOptionPrixMini(sb, svm.PrixMini);
            sb = new SearchOptionDateDebut(sb, svm.DateDebut);
            var result = sb.GetResult();
            return View(result);
        }

        public JsonResult ListeVille()
        {
            var lV = new Form114Entities().Villes.OrderBy(v => v.name).Select(v => new { id = v.idVille, name = v.name });
            return Json(lV, JsonRequestBehavior.AllowGet);
        }
    }
}