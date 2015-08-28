using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Areas.Areas.Models
{
    public class ProduitsViewModel
    {
        public int IdProduit { get; set; }
        public int IdVille { get; set; }
        public int NbPlaces { get; set; }
        public string Adresse { get; set; }
        public string Description { get; set; }
        public double Prix { get; set; }
    }
}