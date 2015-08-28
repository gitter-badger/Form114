using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Form114.Infrastructure
{
    public static class MyCarouselHelper
    {
        public static MvcHtmlString MyCarousel(this HtmlHelper self, List<string> listePhotos,int id, string cadre, string MonImage)
        {
            Random rd = new Random();
            int valeur1 = rd.Next();
            valeur1 = rd.Next();
            var str = "";
            str += "<div id=\"myCarousel"+Convert.ToString(id)+"\" class=\"carousel slide\" data-ride=\"carousel\">";
            str += "<div class=\"carousel-inner\" role=\"listbox\">";
            for (int i = 0; i < listePhotos.Count(); i++ )
            {
                if (i == 0)
                {
                    str += "<div class=\"item active\">";
                    str += "<div class=\""+cadre+"\">";
                    str += "<img src=\"/Images/"+listePhotos[i].Trim()+"\" alt=\"Pas de photo\" class=\""+MonImage+"\"/>";
                    str += "</div>";
                    str += "</div>";
                }
                else
                {
                    str += "<div class=\"item\">";
                    str += "<div class=\""+cadre+"\">";
                    str += "<img src=\"/Images/" + listePhotos[i].Trim() + "\" alt=\"Pas photo\" class=\""+MonImage+"\"/>";
                    str += "</div>";
                    str += "</div>";
                }
            }
            
            str += "</div>";
            str += "<a class=\"left carousel-control\" href=\"#myCarousel"+Convert.ToString(id)+"\" role=\"button\" data-slide=\"prev\">";
            str += "<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>";
            str += "<span class=\"sr-only\">Previous</span>";
            str += "</a>";
            str += "<a class=\"right carousel-control\" href=\"#myCarousel"+Convert.ToString(id)+"\" role=\"button\" data-slide=\"next\">";
            str += "<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>";
            str += "<span class=\"sr-only\">Next</span>";
            str += "</a></div>";


//            div id="myCarousel" class="carousel slide" data-ride="carousel">
//    <div class="carousel-inner" role="listbox">
//        <div class="item active">
//            <div class="cadre">
//            <img src="~/Images/@Model.ListPhotos[0]" alt="Pas de photo" class="MonImage"/>
//            </div>
//        </div>
//        <div class="item">
//            <div class="cadre">
//            <img src="~/Images/@Model.ListPhotos[1]" alt="Pas de photo" class="MonImage" />
//            </div>
//        </div>
//    </div>
//    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
//        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
//        <span class="sr-only">Previous</span>
//    </a>
//    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
//        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
//        <span class="sr-only">Next</span>
//    </a>
//</div>







//            var divTag = new TagBuilder("div");
//            divTag.AddCssClass("carousel slide carousel-height");
//            divTag.Attributes.Add("id", id);
//            divTag.Attributes.Add("data-ride", "carousel");

//            var olTag = new TagBuilder("ol");
//            olTag.AddCssClass("carousel-indicators");

//            var divInnerTag = new TagBuilder("div");
//            divInnerTag.AddCssClass("carousel-inner");
//            divInnerTag.Attributes.Add("role", "listbox");
            
//            for (int i = 0; i < listePhotos.Count; i++)
//            {
//                var divImageTag = new TagBuilder("div");
//                var imgTag = new TagBuilder("img");
//                var liTag = new TagBuilder("li");
//                liTag.Attributes.Add("data-target", "#" + id);
//                if (i == 0)
//                {
//                    liTag.AddCssClass("active");
//                    divImageTag.AddCssClass("item active");
//                }
//                else
//                    divImageTag.AddCssClass("item");

//                liTag.Attributes.Add("data-slide-to", i.ToString());
//                olTag.InnerHtml += liTag.ToString();

//                imgTag.Attributes.Add("src", "/Images/"+listePhotos[i]);
//                imgTag.Attributes.Add("alt", "Image indisponible");
//                imgTag.AddCssClass("image-carousel");
//                divImageTag.InnerHtml = imgTag.ToString();
//                divInnerTag.InnerHtml += divImageTag.ToString();
//            }
//            divTag.InnerHtml += olTag.ToString();
//            divTag.InnerHtml += divInnerTag.ToString();
//            string s = "  <a class='left carousel-control' href=\"#" + id + "\" role='button' data-slide='prev'>"+
//                    @"<span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span>
//                    <span class='sr-only'>Previous</span>
//                    </a>"+
//                    "<a class='right carousel-control' href=\"#" + id + "\" role='button' data-slide='next'>"+
//                    @"<span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span>
//                    <span class='sr-only'>Next</span>
//                    </a>";

//            divTag.InnerHtml += s;

            return new MvcHtmlString(str);

        }
    }
}