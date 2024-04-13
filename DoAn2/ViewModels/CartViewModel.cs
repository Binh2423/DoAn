using DoAn2.Models;
using System.Reflection.Metadata;

namespace DoAn2.ViewModels
{
    public class CartViewModel
    {
       
        public List<Menu> Menus { get; set; }

        public List<CartItem> CartItems { get; set; }
    }
}
