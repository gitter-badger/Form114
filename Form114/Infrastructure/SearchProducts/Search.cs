using DataLayer.Models;
using Form114.Infrastructure.SearchProducts.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure.SearchProducts
{
    internal class Search :SearchBase
    {
        private List<Produits> SearchAnnonces;

        public Search()
        {
            SearchAnnonces = new Form114Entities().Produits.ToList();
        }


        public Search(List<Produits> result)
        {
            SearchAnnonces = result;
        }

        public override List<Produits> GetResult()
        {
            return SearchAnnonces;
        }
    }
}