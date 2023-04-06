using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Trang_Tin_News.Models;

namespace Trang_Tin_News.Controllers
{
    public class NewsController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string username, string password)
        {
            if (CheckLogin(username, password))
            {
                return RedirectToAction("List", "News");
            }
            else
            {
                ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không chính xác.";
                return View();
            }
        }

        private bool CheckLogin(string username, string password)
        {
            // Kiểm tra thông tin đăng nhập và trả về true nếu thông tin đăng nhập đúng, ngược lại trả về false
            // Trong ví dụ này, mật khẩu đúng là "123456"
            if (username == "admin" && password == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public ActionResult List()
        {

            TrangTinTucContext context = new TrangTinTucContext();
            context.SaveChanges();
            var ca = context.Categories.ToList();
            ViewBag.ca = ca;
           
            var list = from n in context.News
                         join c in context.Categories on n.CategoryId equals c.CategoryId
                         join u in context.Users on n.AuthorId equals u.UserId
                         select new
                         {
                             NewsID=n.NewsId,
                             AuthorName = u.Fullname,
                             NewsTitle = n.Title,
                             CategoryTitle = c.Title,
                             NewsBody = n.Body,
                             NewsDate = n.Date.ToString("dd/MM/yyyy"),
                         };
            ViewBag.list = list;
            return View();
        }
        // GET: NewsController
        //public ActionResult Index()
        //{
        //    return View();
        //}

        // GET: NewsController/Details/5
        public ActionResult Details(int id)
        {
            using (var context = new TrangTinTucContext())
            {
                News n = context.News.FirstOrDefault(x => x.NewsId == id);
                Category cate = context.Categories.FirstOrDefault(x => x.CategoryId == n.CategoryId);
                User us = context.Users.FirstOrDefault(x => x.UserId == n.AuthorId);
                ViewBag.user = us;
                ViewBag.category = cate;
                ViewBag.news = n;
            }
            return View();
        }

        // GET: NewsController/Create
        public ActionResult Create()
        {
            using (var context = new TrangTinTucContext())
            {
                List<Category> cate = context.Categories.ToList();
                ViewBag.cate = cate;
            }
            return View();
        }

        // POST: NewsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]

        
        public ActionResult Create(IFormCollection collection)
        {

            return View();  
        }
        [HttpPost]
        public IActionResult Add()
        {
            using (var context = new TrangTinTucContext())
            {
                News n = new News();
                n.Title = HttpContext.Request.Form["til"];
                n.Body = HttpContext.Request.Form["body"];
                n.CategoryId = int.Parse(HttpContext.Request.Form["cate"]);
                n.Date= DateTime.Now;
                context.News.Add(n);
                context.SaveChanges();
            }
            return Redirect("/News/List");
        }

        // GET: NewsController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: NewsController/Edit/5
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

        // GET: NewsController/Delete/5
        public ActionResult Delete(int id)
        {

            using (var context = new TrangTinTucContext())
            {
                context.SaveChanges();
                News newsItem = context.News.SingleOrDefault(x => x.NewsId == id);
                if (newsItem != null)
                {
                    context.News.Remove(newsItem);
                    context.SaveChanges();
                    TempData["SuccessMessage"] = "Mục đã được xóa thành công";
                }
            }
            return Redirect("/News/List");
        }

        // POST: NewsController/Delete/5
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
