using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Form114.Infrastructure.Filters
{
    public class ProduitTrackerFilterAttribute : ActionFilterAttribute
    {
        private Form114Entities _db = new Form114Entities();

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //Accès au paramètre : id vaut IdProduit
            var ap = filterContext.ActionParameters.First();
            //var paramName = ap.Key; // Normalement IdProduit
            //var paramValue = (int)ap.Value;

            var pt = new ProduitTracking();
            pt.DatePT = DateTime.Now;
            pt.IdProduit = (int)ap.Value; 

            _db.ProduitTracking.Add(pt);
            _db.SaveChanges();
        }
    }
}