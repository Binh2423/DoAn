
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
            var maytinhs = await _context.MayTinhs.Take(3).ToListAsync();
            var monchinhs = await _context.ThucPhams.Where(m => m.MaLoai == "TP04").Take(3).ToListAsync();
            var doanvats = await _context.ThucPhams.Where(m => m.MaLoai == "TP03").Take(3).ToListAsync();
            var nuocuongs = await _context.ThucPhams.Where(m => m.MaLoai == "TP01").Take(3).ToListAsync();
            var nuocphaches = await _context.ThucPhams.Where(m => m.MaLoai == "TP02").Take(3).ToListAsync();
            var ViewModel = new HomeViewModel
            {
                Menus = menus,
                Maytinhs = maytinhs,
                Monchinhs = monchinhs,
                Doanvats = doanvats,
                Douongs = nuocuongs,
                Nuocphaches = nuocphaches,
            };
            return View(ViewModel);
        }
        public async Task<IActionResult> _SliderPartial()
        {
            return PartialView();
        }
        public async Task<IActionResult> _BodyPartial()
        {
            return PartialView();
        }

    }
}