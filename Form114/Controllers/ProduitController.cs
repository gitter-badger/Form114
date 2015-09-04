using DataLayer.Models;
using Form114.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Form114.Infrastructure.Filters;
using Form114.Infrastructure;
using Microsoft.AspNet.Identity;
using System.Net.Mail;
using System.Net;

namespace Form114.Controllers
{
    public class ProduitController : Form114Controller
    {
        // private Form114Entities _db = new Form114Entities();

        //public ProduitController()
        //{
        //    BCI.Add(new BreadCrumbItem("Produits", "Index", "Produit"));
        //}

        // GET: Produit
        public ActionResult Index()
        {
            return View();
        }

        // GET: Produit
        /// <summary>
        /// Affiche les details d'un produit
        /// </summary>
        /// <param name="id">idProduit du produit à afficher</param>
        /// <returns>Vue partielle</returns>
        [ChildActionOnly]
        public PartialViewResult Miniature(int id)
        {
            var produit = _db.Produits.Find(id);
            var listePhotos = produit.Photos.Select(p => p.Path).ToList();
            var pr = new ProduitViewModel()
            {
                IdProduit = produit.IdProduit,
                NbPlaces = produit.NbPlaces ?? 1,
                Adresse = produit.Adresse,
                ListPhotos = listePhotos
            };
            return PartialView("_ProduitMini", pr);
        }

        [ProduitTrackerFilter]
        public ActionResult Details(int id)
        {
            var produit = _db.Produits.Find(id);
            var listePhotos = produit.Photos.Select(p => p.Path).ToList();
            var prix = produit.Prix != null ? 0 : produit.Prix.FirstOrDefault().Montant;
            var pr = new ProduitViewModel()
            {
                IdProduit = produit.IdProduit,
                NbPlaces = produit.NbPlaces ?? 1,
                Adresse = produit.Adresse,
                ListPhotos = listePhotos,
                Prix = (prix != null ? (int)prix : 0)
            };
            var ville = _db.Produits.Find(id).Villes;            
            var pays = _db.Villes.Find(ville.idVille).Pays;     
            string nomRegion = _db.Pays.Find(pays.CodeIso3).Regions.name;
            BCI.Add(new BreadCrumbItem(nomRegion, "Details", "Produit"));
            BCI.Add(new BreadCrumbItem(pays.Name, "Details", "Produit"));
            BCI.Add(new BreadCrumbItem(ville.name, "Details", "Produit"));
            return View(pr);
        }

        [HttpPost]
        public JsonResult AjouterCommentaire(CommentViewModel cvm)
        {
            var c = new DataLayer.Models.Commentaires()
            {
                idParent = cvm.parent_id,
                datePoste = DateTime.Now,
                idProduit = cvm.product_id,
                texte = cvm.text,
                idAuteur = _user.GetUserId()
            };
            _db.Commentaires.Add(c);
            _db.SaveChanges();

            var auteur = _user.Name;
            var auteurOriginal = _db.Commentaires.Where(co => co.idComment == cvm.parent_id).Select(p => p.AspNetUsers.UserName);
            int nbComm = _db.Commentaires.Where(co => co.idProduit == 2).Count();

            var results = new Dictionary<string, object>();
            results.Add("success", "true");
            var comments = new List<Dictionary<string, object>>();
            var comment = new Dictionary<string, object>();
            results.Add("parent_id", cvm.parent_id);
            results.Add("in_reply_to", auteurOriginal);
            results.Add("element_id", "134");
            results.Add("created_by", "1");
            results.Add("fullname", auteur);
            results.Add("picture", "../../Content/Comments/images/user_blank_picture.png");
            results.Add("posted_date", c.datePoste.ToString());
            results.Add("text", c.texte);
            var children = new List<Dictionary<string, object>>();
            results.Add("childrens", children);
            var users = new Dictionary<string, string>();
            users.Add("user_id", "1");
            users.Add("fullname", "Administrator admin");
            users.Add("picture", "../../Content/Comments/images/user_blank_picture.png");
            users.Add("is_logged_in", "false");
            users.Add("is_add_allowed", "true");
            users.Add("is_edit_allowed", "true");

            results.Add("user", users);
            var r = new CommentViewModel()
            {
                success = true,
                results = results
            };
            return Json(results);
        }

        [HttpPost]
        public JsonResult ModifierCommentaire(CommentViewModel cvm, int id)
        {
            var comment = _db.Commentaires.Find(id);
            comment.texte = cvm.text;
            _db.SaveChanges();

            var results = new Dictionary<string, object>();
            results.Add("success", "true");
            results.Add("comment_id", id);
            results.Add("text", cvm.text);
            return Json(results);
        }

        [HttpPost]
        public JsonResult RetirerCommentaire(CommentViewModel cvm)
        {
            var c = _db.Commentaires.Find(cvm.comment_id);
            _db.Commentaires.Remove(c);
            _db.SaveChanges();
            int nbComm = _db.Commentaires.Where(co => co.idProduit == 2).Count();
            var r = new CommentViewModel()
            {
                success = true,
                total_comment = nbComm
            };
            return Json(r);
        }

        public JsonResult GetJSONDateOccupees(int id)
        {
            var result = _db.Reservations.Where(r => r.IdProduit == id).Select(r => new { r.DateDebut, r.DateFin }).ToList();
            var allDates = new List<string>();
            foreach (var item in result)
            {
                var startingDate = item.DateDebut;
                var endingDate = item.DateFin;
                for (DateTime date = startingDate; date <= endingDate; date = date.AddDays(1))
                    allDates.Add(date.ToShortDateString());
            }

            return Json(allDates, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCommJSON(int id)
        {
            var comm = _db.Commentaires.Where(c => c.idProduit == id).OrderBy(c => c.idParent);
            var comments = new List<Dictionary<string, object>>();
            var dictAllcomments = new Dictionary<int, Dictionary<string, object>>();
            foreach (var item in comm)
            {
                var comment = new Dictionary<string, object>();
                comment.Add("comment_id", item.idComment);
                comment.Add("parent_id", item.idParent ?? 0);
                comment.Add("in_reply_to", "null");
                comment.Add("element_id", "134");
                comment.Add("created_by", "1");
                comment.Add("fullname", "Administrator admin");
                comment.Add("picture", "../../Content/Comments/images/user_blank_picture.png");
                comment.Add("posted_date", item.datePoste.ToString("yyyy-MM-ddTHH:mm:ssZ"));
                comment.Add("text", item.texte);
                var children = new List<Dictionary<string, object>>();
                comment.Add("childrens", children);

                if (item.idParent == null)
                    comments.Add(comment);
                dictAllcomments.Add((int)comment["comment_id"],comment);
            }
            foreach (var item in dictAllcomments)
            {
                foreach (var item1 in dictAllcomments)
                    if (item.Key == (int)item1.Value["parent_id"])
                    {
                        ((List<Dictionary<string, object>>)item.Value["childrens"])
                            .Add(item1.Value);
                    }
            }
            var users = new Dictionary<string, string>();
            users.Add("user_id", "1");
            users.Add("fullname", "Administrator admin");
            users.Add("picture", "../../Content/Comments/images/user_blank_picture.png");
            users.Add("is_logged_in", "false");
            users.Add("is_add_allowed", "true");
            users.Add("is_edit_allowed", "true");
            var results = new Dictionary<string, object>();
            results.Add("comments",comments);
            results.Add("total_comment", comm.Count());
            results.Add("user", users);
            var r = new CommentViewModel(){
                 success = true,
                 results = results
            };
            return Json(r, JsonRequestBehavior.AllowGet);
        }
    }
}