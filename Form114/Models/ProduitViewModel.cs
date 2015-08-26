using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataLayer.Models;

namespace Form114.Models
{
    public class ProduitViewModel
    {
        public int IdProduit { get; set; }
        public int NbPlaces { get; set; }
        public string Adresse { get; set; }
        public List<String> ListPhotos { get; set; }

        public DateTime DateDebut { get; set; }
        public DateTime DateFin { get; set; }
    }
}