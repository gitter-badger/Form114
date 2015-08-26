using DataLayer.Models;
using Form114.Infrastructure.SearchProducts.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure.SearchProducts.Options
{
    internal class SearchOptionPrixMini : SearchOption
    {
        private readonly int? _prixMini;



        public SearchOptionPrixMini(SearchBase sb, int? prixMini)
            : base(sb)
        {
            _prixMini = prixMini;
        }

        public override List<Produits> GetResult()
        {
            //return _Ville != null ? new Form114Entities().Produits.Where(p => p.IdVille == _Ville).OrderBy(p => p.IdProduit) : new Form114Entities().Produits.OrderBy();

            List<Produits> listeDeProduitsPrixMini = new List<Produits>();

            var db = new Form114Entities();
            var lPrix = db.Prix.Where(p => p.Montant >= _prixMini).ToList();
            foreach(var item in lPrix)
            {
                var list = SearchBase.GetResult().Where(p => p.IdProduit == item.IdProduit);

                if (list.Count() > 1)
                {
                    foreach (var item1 in list)
                    {
                        listeDeProduitsPrixMini.Add(item1);
                    }
                }
                else
                {
                    var list1 = list.FirstOrDefault();
                    listeDeProduitsPrixMini.Add(list1);
                }
            }
            // TODO : refaire après la mise a jour base de données sur la table Produits, prix ne pas être null

            return _prixMini != null ? listeDeProduitsPrixMini : SearchBase.GetResult().OrderBy(p => p.IdProduit).ToList();

        }
    }
}