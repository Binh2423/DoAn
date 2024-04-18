using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace DoAn2.Controllers
{
    public class AdminController : Controller
    {
        private readonly DoAnWebContext _context;

        public AdminController(DoAnWebContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {

           
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();

           
            var ViewModel = new AdminViewModel
            {
                
                Menus = menus
            };
            return View(ViewModel);

        }
    }
}
