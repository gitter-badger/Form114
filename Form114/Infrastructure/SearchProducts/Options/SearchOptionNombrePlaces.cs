using DataLayer.Models;
using Form114.Infrastructure.SearchProducts.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure.SearchProducts.Options
{
    internal class SearchOptionNombrePlaces : SearchOption
    {
        private readonly int? _nombreDePlace;



        public SearchOptionNombrePlaces(SearchBase sb, int? nombreDePlace)
            : base(sb)
        {
            _nombreDePlace = nombreDePlace;
        }

        public override IEnumerable<Produits> GetResult()
        {
            //return _Ville != null ? new Form114Entities().Produits.Where(p => p.IdVille == _Ville).OrderBy(p => p.IdProduit) : new Form114Entities().Produits.OrderBy();
            // TODO : refaire après la mise a jour base de données sur la table Produits, prix ne pas être null

            return _nombreDePlace != null ? SearchBase.GetResult().Where(p => p.NbPlaces >= _nombreDePlace).OrderBy(p => p.IdProduit).ToList() : SearchBase.GetResult().OrderBy(p => p.IdProduit).ToList();
        }

    }
}