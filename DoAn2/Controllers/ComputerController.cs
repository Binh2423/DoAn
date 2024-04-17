using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;
using System;
using static System.Runtime.InteropServices.JavaScript.JSType;
using String = System.String;

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
            var Loai = await _context.Loais.Where(m => m.MaLoai.StartsWith("MT")).ToListAsync();
            ViewBag.LoaiMay = new SelectList(Loai, "MaLoai", "TenLoai","MT10");
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
        //public async Task<IActionResult> CateCom(String link, String maloai)
        //{
        //    var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
        //    var catecom = await _context.Loais.FirstOrDefaultAsync(m => m.Link == link && m.MaLoai == maloai);
        //    if (catecom == null)
        //    {
        //        return NotFound();
        //    }

        //    var maytinhs = await _context.MayTinhs.Where(m => m.Hide == false && m.MaLoai == catecom.MaLoai).OrderBy(m => m.Order).ToListAsync();

        //    var ViewModel = new ComputerViewModel
        //    {
        //        MayTinhs = maytinhs,
        //        Menus = menus
        //    };

        //    return View(ViewModel);
        //}
        [HttpPost]
        public async Task<JsonResult> ThueMay(int IdMay)
        {
            try
            {
                var users = new TaiKhoan();
                var mayTinh = await _context.MayTinhs.SingleOrDefaultAsync(m => m.IdMay == IdMay);

                mayTinh.TrangThai = true;
                mayTinh.HinhAnh = "MH_Xanh.jpg";
                _context.MayTinhs.Update(mayTinh);


                // Nếu không tìm thấy máy tính hoặc máy tính không có sẵn để thuê, có thể trả về một trang lỗi hoặc thực hiện hành động phù hợp khác

                if (User.Identity.IsAuthenticated)
                {
                    string username = User.Identity.Name;
                    if (username != null) users = await _context.TaiKhoans.FirstOrDefaultAsync(m => m.Sdt == username);
                }

                var order = new Cttt
                {
                    IdMay = mayTinh.IdMay,
                    GioBatDau = DateTime.Now, // Thời gian bắt đầu thuê là thời gian hiện tại
                    Sdt = users.Sdt
                };
              
                _context.Cttts.Add(order);
                await _context.SaveChangesAsync();
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // Xử lý lỗi ở đây nếu cần
                return Json(new { success = false, error = "Document not found" });
            }


        }
        [HttpPost]
        public async Task<JsonResult> Delete(int IdMay)
        {
            var maytinh = await _context.MayTinhs.SingleOrDefaultAsync(m => m.IdMay == IdMay);
            if (maytinh != null)
            {
                maytinh.Hide = true;
                _context.MayTinhs.Update(maytinh); // Remove the entity
                await _context.SaveChangesAsync(); // Save changes to the database
                return Json(new { success = true });
            }
            return Json(new { success = false, error = "Document not found" });
        }
        [HttpPost]
        public async Task<JsonResult> Edit(int IdMay)
        {
            var maytinh = await _context.MayTinhs.SingleOrDefaultAsync(m => m.IdMay == IdMay);
            if (maytinh != null && maytinh.BiHong == false)
            {
                maytinh.BiHong = true;
                maytinh.HinhAnh = "MH_Virus_x.jpg";
                _context.MayTinhs.Update(maytinh);
                await _context.SaveChangesAsync(); // Save changes to the database
                return Json(new { success = true });
            }
            else if (maytinh != null && maytinh.BiHong == true)
            {
                maytinh.BiHong = false;
                maytinh.HinhAnh = "MH_Den.jpg";
                _context.MayTinhs.Update(maytinh);
                await _context.SaveChangesAsync(); // Save changes to the database
                return Json(new { success = true });
            }
            return Json(new { success = false, error = "Document not found" });
        }

        [HttpPost]
        public async Task<JsonResult> TraMay(int IdMay)
        {
            try
            {
                var users = new TaiKhoan();
                var mayTinh = await _context.MayTinhs.SingleOrDefaultAsync(m => m.IdMay == IdMay);

                mayTinh.TrangThai = false;
                mayTinh.HinhAnh = "MH_Den.jpg";
                _context.MayTinhs.Update(mayTinh);
                // Nếu không tìm thấy máy tính hoặc máy tính không có sẵn để thuê, có thể trả về một trang lỗi hoặc thực hiện hành động phù hợp khác

                if (User.Identity.IsAuthenticated)
                {
                    string username = User.Identity.Name;
                    if (username != null) users = await _context.TaiKhoans.FirstOrDefaultAsync(m => m.Sdt == username);
                }
                var order = await _context.Cttts.SingleOrDefaultAsync(m => m.IdMay == IdMay && m.Sdt == users.Sdt);
                order.GioKetThuc = DateTime.Now;
                DateTime starttime = Convert.ToDateTime(order.GioBatDau);
                DateTime endtime = Convert.ToDateTime(order.GioKetThuc);
                TimeSpan span = endtime.Subtract(starttime);
                double timedeff;
                if (span.Minutes <= 59)
                {
                     timedeff = (double)span.Minutes / 60;
                    order.SoGioDaSuDung = (decimal)Math.Round(timedeff, 2);
                }
                    
                timedeff = (double)span.Hours + (double)span.Minutes/60;
                order.SoGioDaSuDung = (decimal?)timedeff;
                order.ThanhTien = (int?)(order.SoGioDaSuDung * mayTinh.Gia);
                users.SoTienTrongTk -= order.ThanhTien;
                _context.TaiKhoans.Update(users);
                _context.Cttts.Update(order);
                await _context.SaveChangesAsync();
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // Xử lý lỗi ở đây nếu cần
                return Json(new { success = false, error = "Document not found" });
            }
        }
        [HttpPost]
        public async Task<JsonResult> Add(string MaLoai)
        {
            try
            {
                string a = MaLoai;
                var Loai = await _context.Loais.SingleOrDefaultAsync(m => m.MaLoai.Equals(MaLoai));
                var computers = await _context.MayTinhs.ToListAsync();
                if (Loai == null)
                    return Json(new { success = false, error = "Mã Loại không xác định" });

                var maytinh = new MayTinh();
              
                maytinh.MaLoai = MaLoai;
                if (computers.Count == 0)
                {
                   
                    maytinh.Order = 1;
                    maytinh.TenMay = "Máy tính " + 1;
                }
                else
                {
                  
                    maytinh.Order = computers.Count + 1;
                    maytinh.TenMay = "Máy tính " + maytinh.Order;
                }
                if (MaLoai == "MT7")
                    maytinh.Gia = 7000;
                else if (MaLoai == "MT8")
                    maytinh.Gia = 8000;
                else if (MaLoai == "MT10")
                    maytinh.Gia = 10000;
                maytinh.HinhAnh = "MH_Den.jpg";
                maytinh.Hide = false;
                maytinh.BiHong = false;
                _context.MayTinhs.Add(maytinh);
                await _context.SaveChangesAsync();
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false, error = "Document not found" });
            }


        }


    }

}
