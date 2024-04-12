using DoAn2.Models;

namespace DoAn2.ViewModels
{
    public class HomeViewModel
    {
        public List<MayTinh> Maytinhs {  get; set; }

        public List<ThucPham> Monchinhs { get; set;}

        public List<ThucPham> Nuocphaches { get; set; }

        public List<ThucPham> Douongs { get; set; }

        public List<ThucPham> Doanvats { get; set; }

        public List<Menu> Menus { get; set; }    


    }
}
