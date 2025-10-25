using BTH8_BT2.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BTH8_BT2.Controllers
{
    public class SachController : Controller
    {
        private MyModel db = new MyModel();

        public ActionResult Index()
        {
            var sach = db.SACHes.Include(s => s.CHUDE).ToList();
            return View(sach);
        }
        public ActionResult Create()
        {
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenChuDe");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SACH sach, HttpPostedFileBase AnhUpload)
        {
            if (AnhUpload != null)
            {
                string filename = System.IO.Path.GetFileName(AnhUpload.FileName);
                string path = Server.MapPath("~/Images/" + filename);
                AnhUpload.SaveAs(path);
                sach.ANHBIA = filename;
            }

            db.SACHes.Add(sach);
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var sach = db.SACHes.Include(s => s.CHUDE).FirstOrDefault(s => s.MASACH == id);
            if (sach == null)
                return HttpNotFound();

            return View(sach);
        }


        // GET: Edit
        public ActionResult Edit(int id)
        {
            var sach = db.SACHes.Find(id);
            if (sach == null)
                return HttpNotFound();

            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenChuDe", sach.MACD);
            return View(sach);
        }

        // POST: Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SACH sach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenChuDe", sach.MACD); // THÊM LẠI
            return View(sach);
        }


        // GET: Delete
        public ActionResult Delete(int id)
        {
            var sach = db.SACHes.Include(s => s.CHUDE).FirstOrDefault(s => s.MASACH == id);
            if (sach == null)
                return HttpNotFound();
            return View(sach);
        }

        // POST: DeleteConfirmed
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var sach = db.SACHes.Find(id);
            db.SACHes.Remove(sach);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


    }
}