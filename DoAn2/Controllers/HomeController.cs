
using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace DoAn2.Controllers
{
    public class HomeController : Controller
    {
        private readonly DoAnWebContext _context;

        public HomeController(DoAnWebContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {

            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var ViewModel = new ComputerViewModel
            {
                Menus = menus
            };
            return View(ViewModel);
        }
        public async Task<IActionResult> _SliderPartial()
        {
            return PartialView();
        }

    }
}
