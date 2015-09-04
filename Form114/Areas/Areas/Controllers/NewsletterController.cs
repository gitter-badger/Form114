using Form114.Areas.Areas.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Net.Mail;
using System.Web.Mvc;
using DataLayer.Models;

namespace Form114.Areas.Areas.Controllers
{
    public class NewsletterController : Controller
    {
        private readonly Form114Entities _db = new Form114Entities();
        // GET: Areas/Newsletter
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public void Envoi(NewsletterViewModel nvm)
        {
            var inscrits = _db.NewsletterInscrits.Select(i => i.Utilisateurs.Identites.AspNetUsers.Email);

            string sujet = nvm.Sujet;
            string body;
            string lien = nvm.Lien;
            foreach (var item in inscrits)
            {
                var user = _db.Identites.Where(i => i.AspNetUsers.Email == item).Select(i => new { i.Nom, i.Prenom }).FirstOrDefault();

                body = "Bonjour, " + user.Prenom + " " + user.Nom + "\n" + nvm.Body + "\nPour vous désinscrire : http://localhost:56706/Areas/Newsletter/Desinscrire?id=" + item;
                EnvoiMail(item, sujet, body);
            }
        }

        public void EnvoiMail(string email, string subject, string body)
        {
            var mailMessage = new MailMessage(/*from, to*/);
            var client = new SmtpClient()
            {
                Host = "smtp.neggruda.net",
                Port = 2525,
                UseDefaultCredentials = false,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                EnableSsl = false,
                Credentials = new NetworkCredential("formationgtm@neggruda.net", "7VfrdsAw")
            };
            mailMessage.From = new MailAddress("no-reply@form114.com", "Newsletter");
            mailMessage.To.Add(new MailAddress(email));
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            client.Send(mailMessage);
        }

        public ActionResult Desinscrire(string id)
        {
            var idClient = _db.AspNetUsers.Where(u => u.Email == id).Select(u => u.Id).FirstOrDefault();
            var idIdentities = _db.Identites.Where(i => i.IdUser == idClient).Select(i => i.Utilisateurs.IdUtilisateur).FirstOrDefault();
            var user = _db.NewsletterInscrits.Where(u => u.idInscrit == idIdentities).FirstOrDefault();

            _db.NewsletterInscrits.Remove(user);
            _db.SaveChanges();

            return View();
        }
    }
}