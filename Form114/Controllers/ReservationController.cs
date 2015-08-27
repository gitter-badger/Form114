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
        private readonly Form114Entities _db = new Form114Entities();
        // GET: Reservation
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public ActionResult Reserver(ReservationViewModel rvm)
        {
            var r = new DataLayer.Models.Reservations()
            {
                DateDebut = rvm.DateDebut,
                DateFin = rvm.DateFin,
                IdProduit = rvm.IdProduit,
                NbPersonnes = rvm.NbPersonnes,
                Prix = rvm.Prix,
                IdClient = _user.GetUserId()
            };
            _db.Reservations.Add(r);
            _db.SaveChanges();
            return View(rvm);
        }

        public ActionResult Reserver()
        {

            return RedirectToAction("Details", "Produit", new { id = 1 });
        }
    }
}