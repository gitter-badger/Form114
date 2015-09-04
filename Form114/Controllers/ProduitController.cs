using DataLayer.Models;
using Form114.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Form114.Infrastructure.Filters;
using Form114.Infrastructure;

namespace Form114.Controllers
{
    public class ProduitController : Form114Controller
    {
        // private Form114Entities _db = new Form114Entities();

        //public ProduitController()
        //{
        //    BCI.Add(new BreadCrumbItem("Produits", "Index", "Produit"));
        //}

        // GET: Produit
        public ActionResult Index()
        {
            return View();
        }

        // GET: Produit
        /// <summary>
        /// Affiche les details d'un produit
        /// </summary>
        /// <param name="id">idProduit du produit à afficher</param>
        /// <returns>Vue partielle</returns>
        [ChildActionOnly]
        public PartialViewResult Miniature(int id)
        {
            var produit = _db.Produits.Find(id);
            var listePhotos = produit.Photos.Select(p => p.Path).ToList();
            var pr = new ProduitViewModel()
            {
                IdProduit = produit.IdProduit,
                NbPlaces = produit.NbPlaces ?? 1,
                Adresse = produit.Adresse,
                ListPhotos = listePhotos
            };
            return PartialView("_ProduitMini", pr);
        }

        [ProduitTrackerFilter]
        public ActionResult Details(int id)
        {
            var produit = _db.Produits.Find(id);
            var listePhotos = produit.Photos.Select(p => p.Path).ToList();
            var prix = produit.Prix.FirstOrDefault().Montant;
            var pr = new ProduitViewModel()
            {
                IdProduit = produit.IdProduit,
                NbPlaces = produit.NbPlaces ?? 1,
                Adresse = produit.Adresse,
                ListPhotos = listePhotos,
                Prix = (prix != null ? (int)prix : 0)
            };
            var ville = _db.Produits.Find(id).Villes;            
            var pays = _db.Villes.Find(ville.idVille).Pays;     
            string nomRegion = _db.Pays.Find(pays.CodeIso3).Regions.name;
            BCI.Add(new BreadCrumbItem(nomRegion, "Details", "Produit"));
            BCI.Add(new BreadCrumbItem(pays.Name, "Details", "Produit"));
            BCI.Add(new BreadCrumbItem(ville.name, "Details", "Produit"));
            return View(pr);
        }

        public JsonResult GetJSONDateOccupees(int id)
        {
            var result = _db.Reservations.Where(r => r.IdProduit == id).Select(r => new { r.DateDebut, r.DateFin }).ToList();
            var allDates = new List<string>();
            foreach (var item in result)
            {
                var startingDate = item.DateDebut;
                var endingDate = item.DateFin;
                for (DateTime date = startingDate; date <= endingDate; date = date.AddDays(1))
                    allDates.Add(date.ToShortDateString());
            }

            return Json(allDates, JsonRequestBehavior.AllowGet);
        }
    }
}