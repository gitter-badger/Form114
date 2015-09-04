using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using DataLayer.Models;
using Form114.Infrastructure;

namespace Form114.Controllers
{
    public abstract class Form114Controller : Controller
    {
        protected Form114Entities _db = new Form114Entities();
        public List<BreadCrumbItem> BCI = new List<BreadCrumbItem>();

        public Form114Controller()
        {
            BCI.Add(new BreadCrumbItem("Home", "", ""));
            ViewBag.BreadCrumb = BCI;
        }

        protected System.Security.Principal.IIdentity _user;

        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
            _user = HttpContext.User.Identity;
        }
    }
}