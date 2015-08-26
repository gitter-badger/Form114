using DataLayer.Models;
using Form114.Infrastructure.SearchProducts.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Infrastructure.SearchProducts.Options
{
    internal class SearchOptionDateDebut : SearchOption
    {
        private readonly DateTime _Debut;

        

        public SearchOptionDateDebut(SearchBase sb, DateTime Debut):base(sb)
        {
            _Debut = Debut;
        }

        public override List<Produits> GetResult()
        {
            // TODO : refaire après la mise a jour base de données sur la table Produits, prix ne pas être null
            List<Produits> listeDeProduitsPrixMini = new List<Produits>();

            var db = new Form114Entities();
            var lPrix = db.Prix.Where(p => p.DateDebut >= _Debut).ToList();
            foreach (var item in lPrix)
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
            

            return _Debut != null ? listeDeProduitsPrixMini : SearchBase.GetResult().OrderBy(p => p.IdProduit).ToList();
        }
    }
}