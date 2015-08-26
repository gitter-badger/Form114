using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Form114.Infrastructure
{
    public static class MyCarouselHelper
    {
        public static MvcHtmlString MyCarousel(this HtmlHelper self, List<string> listePhotos, string id)
        {

            var divTag = new TagBuilder("div");
            divTag.AddCssClass("carousel slide carousel-height");
            divTag.Attributes.Add("id", id);
            divTag.Attributes.Add("data-ride", "carousel");

            var olTag = new TagBuilder("ol");
            olTag.AddCssClass("carousel-indicators");

            var divInnerTag = new TagBuilder("div");
            divInnerTag.AddCssClass("carousel-inner");
            divInnerTag.Attributes.Add("role", "listbox");
            
            for (int i = 0; i < listePhotos.Count; i++)
            {
                var divImageTag = new TagBuilder("div");
                var imgTag = new TagBuilder("img");
                var liTag = new TagBuilder("li");
                liTag.Attributes.Add("data-target", "#" + id);
                if (i == 0)
                {
                    liTag.AddCssClass("active");
                    divImageTag.AddCssClass("item active");
                }
                else
                    divImageTag.AddCssClass("item");

                liTag.Attributes.Add("data-slide-to", i.ToString());
                olTag.InnerHtml += liTag.ToString();

                imgTag.Attributes.Add("src", "/Images/"+listePhotos[i]);
                imgTag.Attributes.Add("alt", "Image indisponible");
                imgTag.AddCssClass("image-carousel");
                divImageTag.InnerHtml = imgTag.ToString();
                divInnerTag.InnerHtml += divImageTag.ToString();
            }
            divTag.InnerHtml += olTag.ToString();
            divTag.InnerHtml += divInnerTag.ToString();
            string s = "  <a class='left carousel-control' href=\"#" + id + "\" role='button' data-slide='prev'>"+
                    @"<span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span>
                    <span class='sr-only'>Previous</span>
                    </a>"+
                    "<a class='right carousel-control' href=\"#" + id + "\" role='button' data-slide='next'>"+
                    @"<span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span>
                    <span class='sr-only'>Next</span>
                    </a>";

            divTag.InnerHtml += s;

            return new MvcHtmlString(divTag.ToString());
            //            <div id="myCarousel" class="carousel slide" data-ride="carousel">
            //  <!-- Indicators -->
            //  <ol class="carousel-indicators">
            //    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            //    <li data-target="#myCarousel" data-slide-to="1"></li>
            //    <li data-target="#myCarousel" data-slide-to="2"></li>
            //    <li data-target="#myCarousel" data-slide-to="3"></li>
            //  </ol>

            //  <!-- Wrapper for slides -->
            //  <div class="carousel-inner" role="listbox">
            //    <div class="item active">
            //      <img src="img_chania.jpg" alt="Chania">
            //    </div>

            //    <div class="item">
            //      <img src="img_chania2.jpg" alt="Chania">
            //    </div>

            //    <div class="item">
            //      <img src="img_flower.jpg" alt="Flower">
            //    </div>

            //    <div class="item">
            //      <img src="img_flower2.jpg" alt="Flower">
            //    </div>
            //  </div>

            //  <!-- Left and right controls -->

            //</div>
        }
    }
}