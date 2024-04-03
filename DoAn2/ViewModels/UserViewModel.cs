using DoAn2.Models;

namespace DoAn2.ViewModels
{
    public class UserViewModel
    {
        public TaiKhoan Register { get; set; }
        public NguoiDung User { get; set; }
        public List<Menu> Menus { get; set; }
        public UserViewModel() {
            Register = new TaiKhoan();
        }
    }
}
