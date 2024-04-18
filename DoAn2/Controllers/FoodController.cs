using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Drawing;
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

        private async Task<string> SaveImageAsync(IFormFile image)
        {
            // Ensure the directory exists
            var directory = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images");
            Directory.CreateDirectory(directory);

            // Generate a unique file name to prevent collision
            var fileName = Guid.NewGuid().ToString() + Path.GetExtension(image.FileName);

            // Check file extension to ensure it's an image file
            var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif" };
            var fileExtension = Path.GetExtension(image.FileName).ToLowerInvariant();
            if (!allowedExtensions.Contains(fileExtension))
            {
                throw new ArgumentException("Invalid file extension. Only JPG, JPEG, PNG, and GIF files are allowed.");
            }

            // Combine directory and file name to get the full save path
            var savePath = Path.Combine(directory, fileName);
            // Copy the file to the save path
            using (var fileStream = new FileStream(savePath, FileMode.Create))
            {
                await image.CopyToAsync(fileStream);
            }

            // Return the relative URL of the saved image
            return fileName;
        }

        [HttpPost]
        public async Task<JsonResult> Create(ThucPham tp, IFormFile HinhAnh)
        {

            if (HinhAnh != null)
            {
                tp.HinhAnh = await SaveImageAsync(HinhAnh);
                tp.Hide = false;
                _context.Add(tp);
                _context.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, error = "Không thể thêm ảnh vào" });

            return Json(new { success = false, error = "Không thể thêm sản phẩm vào" });
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
            var catefood = await _context.Loais.Where(m => m.Link == link).FirstOrDefaultAsync();
            if (catefood == null)
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




        [HttpPost]
        public async Task<JsonResult> Edit(ThucPham tp)
        {
           
            if (tp != null && _context.ThucPhams.Any(m => m.MaTp == tp.MaTp))
            {
                _context.Update(tp);
                _context.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, error = "Không thể sửa sản phẩm vào" });
        }
    }


}

