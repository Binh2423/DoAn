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
            var Loai = await _context.LoaiThucPhams.Where(m => m.MaLoai.Substring(0, 2) == "TP").ToListAsync();
            ViewBag.Loai = new SelectList(Loai, "MaLoai", "TenLoai");
            var ViewModel = new FoodViewModel
            {
                Menus = menus,
                ThucPhams = thucphams

            };
            return View(ViewModel);
        }
        [HttpPost]
        public async Task<IActionResult> Add(ThucPham tp, IFormFile imageUrl)
        {
            var loai = await _context.LoaiThucPhams.Select(m=> m.MaLoai).ToListAsync();
            var thucpham = await _context.ThucPhams.ToListAsync();
            if(thucpham.Count==0)
            {
                tp.MaTp = 1;
            }
            else
            {
                tp.MaTp = thucpham.Count+1;
            }
            if (ModelState != null)
            {
                if (imageUrl != null)
                {
                    tp.HinhAnh = await SaveImage(imageUrl);
                }
                await _context.ThucPhams.AddAsync(tp);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index","Food");
            }
            
            return View(tp);
            
        }
        [HttpPost]
        public async Task<JsonResult> Delete(int maTp)
        {
            try
            {
                var thucPham = await _context.ThucPhams.FindAsync(maTp);
                if (thucPham != null)
                {
                    thucPham.Hide = true;
                    _context.ThucPhams.Update(thucPham);
                    await _context.SaveChangesAsync();
                    return Json(new { success = true });
                }
                return Json(new { success = false, error = "Document not found" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, error = ex.Message });
            }
        }
        private async Task<String> SaveImage(IFormFile image)
        {
            var savePath = Path.Combine("wwwroot/images", image.FileName);
            using (var fileStream = new FileStream(savePath, FileMode.Create))
            {
                await image.CopyToAsync(fileStream);
            }
            return  image.FileName;
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

        public JsonResult DSThucPham()
        {
            try {
                var dsThucPham = (from i in _context.ThucPhams.Where(m => m.Hide == false)
                                  select new
                                  {
                                      MaTp = i.MaTp,
                                      TenTp = i.TenTp,
                                      MaLoai = i.MaLoai,
                                      GiaTp = i.GiaTp,
                                      SoLuong = i.SoLuong,
                                      HinhAnh = i.HinhAnh,
                                      Order = i.Order,
                                      Hide = i.Hide,
                                  }).ToList();
                return Json(new {code = 200, dsThucPham = dsThucPham});
            }
            catch
            {
                return Json(new { code = 00, msg = "False" });
            }
        }
       
    }
}
