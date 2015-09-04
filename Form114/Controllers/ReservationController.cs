using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Form114.Models;
using DataLayer.Models;
using Microsoft.AspNet.Identity;

namespace Form114.Controllers
{
    public class ReservationController : Form114Controller
    {
        // GET: Reservation
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public ActionResult Reserver(ReservationViewModel rvm)
        {
            var userID = _user.GetUserId();
            var nbReserv = _db.Reservations.Where(r => r.IdClient == userID).Count();
            var prixBase  = rvm.Prix;
            int prix = nbReserv > 0 ? (int)Math.Round(prixBase * 0.90, 1) : prixBase;
            var res = new DataLayer.Models.Reservations()
            {
                DateDebut = rvm.DateDebut,
                DateFin = rvm.DateFin,
                IdProduit = rvm.IdProduit,
                NbPersonnes = rvm.NbPersonnes,
                Prix = prix,
                IdClient = _user.GetUserId()
            };
            rvm.Prix = prix;
            _db.Reservations.Add(res);
            _db.SaveChanges();
            return View(rvm);
        }

        public ActionResult Reserver()
        {

            return RedirectToAction("Details", "Produit", new { id = 1 });
        }
    }
}