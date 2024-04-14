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
                if (list.Exists(x => x.thucpham.MaTp == ProductId))
                {
                    foreach (var item in list)
                    {
                        if (item.thucpham.MaTp == ProductId)
                        {
                            item.Quantity += Quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.thucpham = product;
                    item.Quantity = Quantity;

                    list.Add(item);
                }
                HttpContext.Session.SetString(CartSession, JsonConvert.SerializeObject(list));
            }
            else
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

        [HttpPost]
        public IActionResult UpdateProduct(int id, int quantity)
        {
            try
            {
                // Lấy giỏ hàng hiện tại từ session
                var sessionCart = HttpContext.Session.GetString(CartSession);
                var existingCart = string.IsNullOrEmpty(sessionCart) ? new List<CartItem>() : JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);

                // Tìm kiếm sản phẩm cần cập nhật số lượng trong giỏ hàng
                var cartItemToUpdate = existingCart.FirstOrDefault(x => x.thucpham.MaTp == id);

                // Nếu sản phẩm tồn tại trong giỏ hàng
                if (cartItemToUpdate != null)
                {
                    // Cập nhật số lượng của sản phẩm
                    cartItemToUpdate.Quantity = quantity;

                    // Lưu giỏ hàng đã cập nhật vào session
                    HttpContext.Session.SetString(CartSession, JsonConvert.SerializeObject(existingCart));

                    // Trả về một phản hồi JSON biểu thị thành công
                    return Json(new { status = true });
                }
                else
                {
                    // Trả về một phản hồi JSON với status false nếu không tìm thấy sản phẩm trong giỏ hàng
                    return Json(new { status = false, message = "Sản phẩm không tồn tại trong giỏ hàng" });
                }
            }
            catch (Exception ex)
            {
                // Trả về một phản hồi JSON với status false và thông báo lỗi nếu có ngoại lệ xảy ra
                return Json(new { status = false, message = ex.Message });
            }
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
