using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace Form114.Infrastructure
{
    public static class EditorForHelper
    {
        public static MvcHtmlString TextBox<TModel, TProperty>(this HtmlHelper<TModel> self, Expression<Func<TModel, TProperty>> expression, int size)
        {

            //var divTag = new TagBuilder("div");
            //divTag.AddCssClass("form-group");

            //Récupérations des helpers standard

            var label = self.LabelFor(expression, new { @class = string.Format("col-sm-{0} control-label", size) });

            var input = self.TextBoxFor(expression, new { @class = "form-control" });

            var valid = self.ValidationMessageFor(expression, "", new { @class = "text-danger" });

            //Construction des balises
            // Le <div> Externe

            var divTag = new TagBuilder("div");
            divTag.AddCssClass("form-group");

            // Le div interne

            var divInnerTag = new TagBuilder("div");
            divInnerTag.AddCssClass(string.Format("col-sm-{0}", 12 - size));

            // Contenu de ce <div> interne 
            divInnerTag.InnerHtml = input.ToString() + valid.ToString();

            divTag.InnerHtml = label.ToString() + divInnerTag.ToString();

            //divTag.InnerHtml = label.ToString();


            return new MvcHtmlString(divTag.ToString());
        }

        public static FormFieldset FieldsetHelper(this HtmlHelper self, string legend)
        {
            return new FormFieldset(self, legend);
        }

        //public static MvcHtmlString Legend(this HtmlHelper<TModel> self,string )
        //{

        //}

        public static MvcHtmlString Slider(this HtmlHelper self)
        {
            string a = "";
            a += "<p>";
            a += "<label for=\"amount\">Prix:</label>";
            a += "<input type=\"text\" id=\"amount\" readonly style=\"border:0; color:#f6931f; font-weight:bold; width:300px \">";
            return new MvcHtmlString(a);
        }
    }
}