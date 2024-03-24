using Microsoft.AspNetCore.Mvc;

namespace DoAn2.Controllers
{
    public class ComputerController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
