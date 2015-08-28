using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataLayer.Models;

namespace Form114.Areas.Areas.Controllers
{
    public class ProduitsController : Controller
    {
        private Form114Entities db = new Form114Entities();

        // GET: Areas/Produits
        public ActionResult Index()
        {
            var produits = db.Produits.Include(p => p.Villes);
            return View(produits.ToList());
        }

        // GET: Areas/Produits/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Produits produits = db.Produits.Find(id);
            if (produits == null)
            {
                return HttpNotFound();
            }
            return View(produits);
        }

        // GET: Areas/Produits/Create
        public ActionResult Create()
        {
            ViewBag.IdVille = new SelectList(db.Villes, "idVille", "name");
            return View();
        }

        // POST: Areas/Produits/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdProduit,IdVille,NbPlaces,Adresse,Description")] Produits produits)
        {
            if (ModelState.IsValid)
            {
                db.Produits.Add(produits);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdVille = new SelectList(db.Villes, "idVille", "name", produits.IdVille);
            return View(produits);
        }

        // GET: Areas/Produits/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Produits produits = db.Produits.Find(id);
            if (produits == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdVille = new SelectList(db.Villes, "idVille", "name", produits.IdVille);
            return View(produits);
        }

        // POST: Areas/Produits/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdProduit,IdVille,NbPlaces,Adresse,Description")] Produits produits)
        {
            if (ModelState.IsValid)
            {
                db.Entry(produits).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdVille = new SelectList(db.Villes, "idVille", "name", produits.IdVille);
            return View(produits);
        }

        // GET: Areas/Produits/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Produits produits = db.Produits.Find(id);
            if (produits == null)
            {
                return HttpNotFound();
            }
            return View(produits);
        }

        // POST: Areas/Produits/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Produits produits = db.Produits.Find(id);
            db.Produits.Remove(produits);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
