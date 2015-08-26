using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Form114.Models;

namespace Form114.Controllers
{
    public class ReservationController : Controller
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
            return View(rvm);
        }

        public ActionResult Reserver()
        {
            return RedirectToAction("Details", "Produit", new { id = 1 });
        }
    }
}