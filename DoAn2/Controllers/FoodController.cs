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
        public async Task<IActionResult> CateFood(String link)
        {

            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var catefood =await _context.LoaiThucPhams.Where(m=> m.Link == link).FirstOrDefaultAsync();
            if(catefood == null)
            {
                return NotFound();
            }

            var thucphams = await _context.ThucPhams.Where(m => m.Hide == false && m.MaLoai == catefood.MaLoai).ToListAsync();
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams
            };
            return View(ViewModel);
        }
        public async Task<IActionResult> _CartPartial()
        {
            return PartialView();
        }
    }
}
