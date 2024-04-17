using DoAn2.Models;

namespace DoAn2.ViewModels
{
    public class AdminViewModel
    {
        public List<Menu> Menus { get; set; }

        public List<TaiKhoan> TaiKhoans { get; set; }

        public List<NguoiDung> NguoiDungs { get; set; }

        public List<Cttt> cttts { get; set; }

        public List<Cthd> cthds { get; set; }
    }
}
