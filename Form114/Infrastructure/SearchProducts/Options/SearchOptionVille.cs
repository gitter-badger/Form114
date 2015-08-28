using DataLayer.Models;
using Form114.Infrastructure.SearchProducts.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure.SearchProducts.Options
{
    internal class SearchOptionVille : SearchOption
    {
        private readonly int[] _Ville;

        

        public SearchOptionVille(SearchBase sb, int[] Ville):base(sb)
        {
            _Ville = Ville;
        }

        public override IEnumerable<Produits> GetResult()
        {
            //return _Ville != null ? new Form114Entities().Produits.Where(p => p.IdVille == _Ville).OrderBy(p => p.IdProduit) : new Form114Entities().Produits.OrderBy();
            // TODO : refaire après la mise a jour base de données sur la table Produits, prix ne pas être null
            if (_Ville == null)
                return SearchBase.GetResult().OrderBy(p => p.IdProduit);
            return SearchBase.GetResult().Where(p => _Ville.ToList().Contains(p.IdVille)).OrderBy(p => p.IdProduit);
        }

    }
}