using Microsoft.AspNetCore.Mvc;

namespace DoAn2.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
