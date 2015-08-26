using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Models
{
    public class ReservationViewModel
    {
        public int IdProduit { get; set; }
        public DateTime DateDebut { get; set; }
        public DateTime DateFin { get; set; }
        public int Prix { get; set; }
    }
}