using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Models
{
    public class SearchViewModel
    {
        public int PrixMaxi { get; set; }
        public int PrixMini { get; set; }
        public string Ville { get; set; }
        public string Région { get; set; }

    }
}