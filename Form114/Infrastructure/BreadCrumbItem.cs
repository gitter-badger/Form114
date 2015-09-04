using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure
{
    public class BreadCrumbItem
    {
        public string text { get; set; }
        public string routeAction { get; set; }
        public string routeController { get; set; }

        public BreadCrumbItem(string text, string routeAction, string routeController)
        {
            this.text = text;
            this.routeAction = routeAction;
            this.routeController = routeController;
        }
    }
}