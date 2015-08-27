using DataLayer.Models;
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

        public static MvcHtmlString Slider(this HtmlHelper self, string slider)
        {
            string a = "";
            a += "<p>";
            a += "<label for=\"amount\">Prix:</label>";
            a += "<input type=\"text\" id=\"amount\" readonly style=\"border:0; color:#f6931f; font-weight:bold; width:300px \">";
            a += "</p>";
            a += "<div id=" + slider + " class=\"col-lg-4\"></div>";
            a += "<input type=\"hidden\" id=\"prixmini\" name=\"PrixMini\" value=\"prixmini\" />";
            a += "<input type=\"hidden\" id=\"prixmaxi\" name=\"PrixMaxi\" value=\"prixmaxi\" />";
            a += "</br>";
            return new MvcHtmlString(a);
        }

        public static MvcHtmlString ListeVille(this HtmlHelper helper)
        {
            string str = "";
            str += "</br>";
            str += "<fieldset>";
            str += "<legend>Choississez la Ville</legend>";
            str += "<div class=\"container\">";
            str += "<div class=\"col-lg-6\">";
            str += "<select id=\"Ville\" name=\"Ville\" class=\"chosen-select form-control\" multiple></select>";
            str += "</div>";
            str += "</div>";
            str += "</fieldset>";
            str += "</br>";
            
            return new MvcHtmlString(str);
        }

        public static MvcHtmlString NombreDePlace(this HtmlHelper helper)
        {
            var str = "";
            str += "<legend>Nombre de Chambre</legend>";
            str += "<select name=\"nbPlaces\">";
            for (int i = 0; i < 10; i++)
            {
                str += "<option value="+(i+1)+">"+(i+1)+"</option>";
            }
            str += "</select>";
            str += "</br>";
            str += "</br>";
            return new MvcHtmlString(str);
        }

        // Inclure Jquery et DatePicker.js
        public static MvcHtmlString DatePicker(this HtmlHelper helper, string texteBouton)
        {
            var str = "";
            str += "<legend>Date de Début et de Fin</legend>";
            str += "<input type=\"text\" id=\"datepicker\" name=\"DateDebut\" placeholder=\"Début\"/>";
            str += "<input type=\"text\" id=\"datepicker1\" name=\"DateFin\" placeholder=\"Fin\"/>";
            str += "<input type=\"submit\" value=\"" + texteBouton + "\" />";
            return new MvcHtmlString(str);
        }

        //public static MvcHtmlString ListeDeroulante(this HtmlHelper helper, string nom)
        //{
        //    var str = "";
        //    str += "<select id=" + nom + ">";
        //    str += "</select>";
        ////            <select id="idRegion">

        ////</select>
        //    return new MvcHtmlString(str);
        //}

    }
}