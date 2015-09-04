using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure.SearchProducts.Base
{
    internal abstract class SearchBase
    {
        protected IEnumerable<Produits> SearchRooms;

        public abstract IEnumerable<Produits> GetResult();
    }
}