using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Security.Claims;
using System.Text.Json.Serialization;

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
            var Loai = await _context.Loais.Where(m => m.MaLoai.Substring(0, 2) == "TP").ToListAsync();
            ViewBag.Loai = new SelectList(Loai, "MaLoai", "TenLoai");
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams

            };
            return View(ViewModel);
        }
        public async Task<IActionResult> Add()
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var Loai = await _context.Loais.Where(m => m.MaLoai.Substring(0, 2) == "TP").ToListAsync();
            ViewBag.Loai = new SelectList(Loai, "MaLoai", "TenLoai");
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
            };
            return View(ViewModel);
        }
        [HttpPost]
        public async Task<IActionResult> Add(ThucPham tp, IFormFile HinhAnh)
        {
           
            var thucpham = await _context.ThucPhams.ToListAsync();
            if(thucpham.Count==0)
            {
                tp.MaTp = 1;
                tp.Order = 1;
            }
            else
            {
                tp.MaTp = thucpham.Count+1;
                tp.Order = thucpham.Count+1;
            }
            if (ModelState != null)
            {
                if (HinhAnh != null)
                {
                    tp.HinhAnh = await SaveImage(HinhAnh);
                }
                tp.Hide = false;
                await _context.ThucPhams.AddAsync(tp);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index","Food");
            }
            
            return View(tp);
            
        }

        private async Task<String> SaveImage(IFormFile image)
        {
            var savePath = Path.Combine("wwwroot/images", image.FileName);
            using (var fileStream = new FileStream(savePath, FileMode.Create))
            {
                await image.CopyToAsync(fileStream);
            }
            return "/images/" + image.FileName;
        }

        public async Task<JsonResult> Delete(int maTp)
        {
            var thucPham = await _context.ThucPhams.SingleOrDefaultAsync(m => m.MaTp == maTp);
            if (thucPham != null)
            {
                thucPham.Hide = true;
                _context.ThucPhams.Update(thucPham); // Remove the entity
                await _context.SaveChangesAsync(); // Save changes to the database
                return Json(new { success = true });
            }
            return Json(new { success = false, error = "Document not found" });
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
            var catefood =await _context.Loais.Where(m=> m.Link == link).FirstOrDefaultAsync();
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

       
        public async Task<IActionResult> Edit(int maTp)
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
            var Loai = await _context.Loais.Where(m => m.MaLoai.Substring(0, 2) == "TP").ToListAsync();
            var thucPham = await _context.ThucPhams.SingleOrDefaultAsync(m => m.MaTp == maTp);
            ViewBag.Loai = new SelectList(Loai, "MaLoai", "TenLoai");
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                TP = thucPham
            };
            return View(ViewModel);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ThucPham thucPham, IFormFile HinhAnh)
        {
            if (ModelState.IsValid)
            {
                if (HinhAnh != null)
                {
                    thucPham.HinhAnh = await SaveImage(HinhAnh);
                }
                _context.Update(thucPham);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "Food");
            }
            return View(thucPham);


        }


    }
}
