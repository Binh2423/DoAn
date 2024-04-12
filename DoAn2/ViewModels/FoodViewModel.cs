using DoAn2.Models;

namespace DoAn2.ViewModels
{
    public class FoodViewModel
    {
        public List<Menu> Menus { get; set; }
        public List<ThucPham> ThucPhams { get; set; }
        
        public ThucPham AddTP {  get; set; }
    }
}
