using DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure.SearchProducts.Base
{
    internal abstract class SearchBase
    {
        public abstract List<Produits> GetResult();
    }
}