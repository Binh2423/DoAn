using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace DoAn2.Controllers
{
    public class UserController : Controller
    {
       private readonly DoAnWebContext _context;

        public UserController(DoAnWebContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<IActionResult> Register()
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var viewModel = new UserViewModel
            {
                Menus = menus,
            };
            return View(viewModel);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(UserViewModel model)
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
           
            var viewModel = new UserViewModel
            {
                Menus = menus,
                Register = model.Register,
            };
            if (model.Register != null)
            {
                var existingUser = await _context.TaiKhoans.FirstOrDefaultAsync(u => u.Sdt == model.Register.Sdt);
                if (existingUser != null)
                {
                    ViewBag.ErrorMessage = "Tên đăng nhập đã tồn tại.";
                    return View(viewModel);
                }
                model.Register.MatKhau = BCrypt.Net.BCrypt.HashPassword(model.Register.MatKhau);
                model.Register.MaVt = "VT04";
                model.Register.Hide = false;
                model.User.Sdt = model.Register.Sdt;
                model.User.Hide = false;
                _context.TaiKhoans.Add(model.Register);
                _context.NguoiDungs.Add(model.User);
                await _context.SaveChangesAsync();
                return RedirectToAction("Login", "User");
            }
            return View(viewModel);
        }
        [HttpGet]
        public async Task<IActionResult> Login()
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            
            var viewModel = new UserViewModel
            {
                Menus = menus,
            };
            return View(viewModel);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(UserViewModel model)
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
          
            var viewModel = new UserViewModel
            {
                Menus = menus,
                Register = model.Register,
            };
            if (model.Register != null)
            {
                var user = await _context.TaiKhoans.FirstOrDefaultAsync(u => u.Sdt ==
               model.Register.Sdt);
                if (user != null && BCrypt.Net.BCrypt.Verify(model.Register.MatKhau,user.MatKhau))
                {
                    var claims = new List<Claim>
             {
                 new Claim(ClaimTypes.Name, user.Sdt),
                 new Claim(ClaimTypes.Role, user.MaVt.ToString()),
             };
                    var claimsIdentity = new ClaimsIdentity(
                    claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var authProperties = new AuthenticationProperties
                    {
                    };
                    await HttpContext.SignInAsync(
                    CookieAuthenticationDefaults.AuthenticationScheme,
                    new ClaimsPrincipal(claimsIdentity),
                    authProperties);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không đúng.";
                    return View(viewModel);
                }
            }
            return View(viewModel);
        }
    }
}
