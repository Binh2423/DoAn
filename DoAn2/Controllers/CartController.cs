using DoAn2.Models;
using DoAn2.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace DoAn2.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        private readonly DoAnWebContext _context;

        public CartController(DoAnWebContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();

            
            var cart = HttpContext.Session.GetString(CartSession);
            var list = new List<CartItem>();
            if (!string.IsNullOrEmpty(cart))
            {
                list = JsonConvert.DeserializeObject<List<CartItem>>(cart);
            }
            var cartViewModel = new CartViewModel
            {
                Menus = menus,
                
                CartItems = list
            };
            return View(cartViewModel);
        }
        public IActionResult AddItem(int ProductId, int Quantity)
        {
            var product = _context.ThucPhams.Find(ProductId);
            var cart = HttpContext.Session.GetString(CartSession);
            if (!string.IsNullOrEmpty(cart))
            {
                var list = JsonConvert.DeserializeObject<List<CartItem>>(cart);
                var existingItem = list.FirstOrDefault(x => x.thucpham.MaTp == ProductId);
                if (existingItem != null)
                {
                    existingItem.Quantity += Quantity;
                    if (existingItem.Quantity <= 0)
                    {
                        // Nếu Quantity <= 0, loại bỏ mục khỏi giỏ hàng
                        list.Remove(existingItem);
                    }
                }
                else if (Quantity > 0)
                {
                    var item = new CartItem();
                    item.thucpham = product;
                    item.Quantity = Quantity;
                    list.Add(item);
                }
                HttpContext.Session.SetString(CartSession, JsonConvert.SerializeObject(list));
            }
            else if (Quantity > 0)
            {
                var item = new CartItem();
                item.thucpham = product;
                item.Quantity = Quantity;
                var list = new List<CartItem>();
                list.Add(item);
                HttpContext.Session.SetString(CartSession, JsonConvert.SerializeObject(list));
            }
            return RedirectToAction("Index");
        }

        public IActionResult DeleteAll()
        {
            HttpContext.Session.Remove(CartSession);
            return Json(new
            {
                status = true
            });
        }
        public IActionResult Delete(int id)
        {
            var sessionCart =
           JsonConvert.DeserializeObject<List<CartItem>>(HttpContext.Session.GetString(CartSession));
            sessionCart.RemoveAll(x => x.thucpham.MaTp == id);
            HttpContext.Session.SetString(CartSession,
           JsonConvert.SerializeObject(sessionCart));
            return Json(new
            {
                status = true
            });
        }

       

        [HttpGet]
        public async Task<IActionResult> Payment(string name)
        {
            var menus = await _context.Menus.Where(m => m.Hide == false).ToListAsync();
          
            var cart = HttpContext.Session.GetString(CartSession);
            var list = new List<CartItem>();
            if (!string.IsNullOrEmpty(cart))
            {
                list = JsonConvert.DeserializeObject<List<CartItem>>(cart);
            }
            var cartViewModel = new CartViewModel
            {
                Menus = menus,
                CartItems = list
            };
            return View(cartViewModel);
        }

        [HttpPost]
        public async Task<IActionResult> Payment()
        {
            var order = new HoaDon();
            order.NgayThanhToan = DateTime.Now;
            var users = new TaiKhoan();
            if (User.Identity.IsAuthenticated)
            {
                string username = User.Identity.Name;
                if (username != null) users = await _context.TaiKhoans.FirstOrDefaultAsync(m =>
               m.Sdt == username);
            }
            order.Sdt = users.Sdt;
            try
            {
                int tong = 0;
                _context.HoaDons.Add(order);
                _context.SaveChanges();
                var id = order.SoHd;
                var cart =
               JsonConvert.DeserializeObject<List<CartItem>>(HttpContext.Session.GetString(CartSession));
                foreach (var item in cart)
                {
                    var detail = new Cthd();
                    detail.MaTp = item.thucpham.MaTp;
                    detail.SoHd = id;
                    detail.SoLuong = (short?)item.Quantity;
                    tong += (int)(item.thucpham.GiaTp * item.Quantity);
                    _context.Cthds.Add(detail);
                    _context.SaveChanges();
                }
                order.TongTien = tong;
                _context.HoaDons.Update(order);
                _context.SaveChanges();
                HttpContext.Session.Clear();
                return Json(new { status = true });
            }
            catch (Exception ex)
            {
                // Xử lý lỗi ở đây nếu cần
                return Json(new { status = false, error = ex.Message });
            }
        }

      
    }
}
