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
        public Search()
        {
            SearchRooms = new Form114Entities().Produits.ToList();
        }


        public Search(IEnumerable<Produits> result)
        {
            SearchRooms = result;
        }

        public override IEnumerable<Produits> GetResult()
        {
            return SearchRooms;
        }
    }
}