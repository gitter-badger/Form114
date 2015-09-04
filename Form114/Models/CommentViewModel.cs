using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Form114.Models
{
    public class CommentViewModel
    {
        // NE PAS CHANGER LA CASSE
        // Elle est forcée par le script javascipt jquery.comment.js
        public Dictionary<string, object> results { get; set; }
        // Pour la suppression, l'ajout et la modification
        public bool success { get; set; }
        // Pour l'ajout
        public string text { get; set; }
        // Pour la réponse
        public int? parent_id { get; set; }
        // Pour la suppression
        public int total_comment { get; set; }
        // Pour la suppression
        public int? comment_id { get; set; }
        public int product_id { get; set; }
    }
}