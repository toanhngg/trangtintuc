﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;



namespace Trang_Tin_News.Controllers
{
    public class ListController : Controller
    {
        public ActionResult List()
        {
            return View();
        }

        // GET: ListController
        public ActionResult Index()
        {
            return View();
        }

        // GET: ListController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ListController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ListController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ListController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ListController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ListController/Delete/5
        //public ActionResult Delete(int id)
        //{
          
        //}

        // POST: ListController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
