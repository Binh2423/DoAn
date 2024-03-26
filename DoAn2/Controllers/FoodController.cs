using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DoAn2.Controllers
{
    public class FoodController : Controller
    {
        private readonly DoAnWebContext _context;

        public FoodController(DoAnWebContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {

            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var thucphams = await _context.ThucPhams.Where(m => m.Hide == false).ToListAsync();
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams

            };
            return View(ViewModel);
        }
        public async Task<IActionResult> _MenuPartial()
        {
            return PartialView();
        }
        public async Task<IActionResult> _SideBarPartial()
        {
            return PartialView();
        }
        public async Task<IActionResult> _BodyPartial()
        {
            return PartialView();
        }
        public async Task<IActionResult> Mon_Chinh()
        {

            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var thucphams = await _context.ThucPhams.Where(m => m.Hide == false && m.MaLoai=="TP04").ToListAsync();
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams

            };
            return View(ViewModel);
        }
        public async Task<IActionResult> Nuoc_Uong()
        {

            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var thucphams = await _context.ThucPhams.Where(m => m.Hide == false && m.MaLoai == "TP01").ToListAsync();
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams

            };
            return View(ViewModel);
        }
        public async Task<IActionResult> Nuoc_Pha_Che()
        {

            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var thucphams = await _context.ThucPhams.Where(m => m.Hide == false && m.MaLoai == "TP02").ToListAsync();
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams

            };
            return View(ViewModel);
        }
        public async Task<IActionResult> Do_An_Vat()
        {

            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var thucphams = await _context.ThucPhams.Where(m => m.Hide == false && m.MaLoai == "TP03").ToListAsync();
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams

            };
            return View(ViewModel);
        }
    }
}
