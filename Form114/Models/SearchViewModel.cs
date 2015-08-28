using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Form114.Models
{
    public class SearchViewModel
    {
        public int? PrixMaxi { get; set; }
        public int? PrixMini { get; set; }
        [XmlArray("Ville")]
        [XmlArrayItem("Ville", typeof(int))]
        public int[] Ville { get; set; }
        public int? nbPlaces { get; set; }
        public DateTime DateDebut { get; set; }
        public DateTime DateFin { get; set; }
        public int Region  { get; set; }
    }
}