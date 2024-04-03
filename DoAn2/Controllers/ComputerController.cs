using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DoAn2.Controllers
{
    public class ComputerController : Controller
    {
        private readonly DoAnWebContext _context;

        public ComputerController(DoAnWebContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {

            var maytinhs = await _context.MayTinhs.Where(m => m.Hide == false).OrderBy(m => m.Order).ToListAsync();
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var ViewModel = new ComputerViewModel
            {
                MayTinhs = maytinhs,
                Menus = menus
            };
            return View(ViewModel);
        }
        public async Task<IActionResult> _BodyPartial()
        {
            return PartialView();
        }
        public async Task<IActionResult> _MenuPartial()
        {
            return PartialView();
        }
        public async Task<IActionResult> CateCom(String link)
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var catecom = await _context.LoaiThucPhams.FirstOrDefaultAsync(m => m.Link == link);
            if(catecom == null)
            {
                return NotFound();
            }

            var maytinhs = await _context.MayTinhs.Where(m => m.Hide == false && m.Gia.ToString().Equals(catecom.MaLoai)).OrderBy(m => m.Order).ToListAsync();
           
            var ViewModel = new ComputerViewModel
            {
                MayTinhs = maytinhs,
                Menus = menus
            };

            return View(ViewModel);
        }
        
    }

}
