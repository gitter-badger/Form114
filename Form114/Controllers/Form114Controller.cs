using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;

namespace Form114.Controllers
{
    public abstract class Form114Controller : Controller
    {
        protected System.Security.Principal.IIdentity _user;

        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
            _user = HttpContext.User.Identity;
        }
    }
}