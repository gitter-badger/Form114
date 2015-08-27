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
            var result = sb.GetResult();
            sb = new SearchOptionNombrePlaces(sb, svm.nbPlaces);
            result = sb.GetResult();
            sb = new SearchOptionPrixMini(sb, svm.PrixMini);
            result = sb.GetResult();
            sb = new SearchOptionDateDebut(sb, svm.DateDebut);
            result = sb.GetResult();
            ViewBag.PrixMini = svm.PrixMini;
            return View(result);
        }

        public JsonResult ListeVille()
        {
            var lV = new Form114Entities().Villes.OrderBy(v => v.name).Select(v => new { id = v.idVille, name = v.name });
            var liste = lV.ToList();
            return Json(lV, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListeVille1(string id)
        {
            var lV = new Form114Entities().Villes.Where( v => v.Pays.CodeIso3 == id).OrderBy(v => v.name).Select(v => new { id = v.idVille, name = v.name });
            var liste = lV.ToList();
            return Json(lV, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListeRegion()
        {
            var lR = new Form114Entities().Regions.OrderBy(r => r.name).Select(r => new { id = r.idRegion, name = r.name });
            return Json(lR, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListePays(string id)
        {
            var ID = Convert.ToInt16(id);
            var lR = new Form114Entities().Pays.Where(r => r.idRegion == ID).OrderBy(r => r.Name).Select(r => new { id = r.CodeIso3, name = r.Name });
            var result = lR.ToList();
            return Json(lR, JsonRequestBehavior.AllowGet);
        }
    }
}