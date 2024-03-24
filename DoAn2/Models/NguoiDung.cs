using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class NguoiDung
{
    public string Sdt { get; set; } = null!;

    public string? HoTen { get; set; }

    public DateTime? NgaySinh { get; set; }

    public string? Email { get; set; }

    public string? DiaChi { get; set; }

    public bool? Hide { get; set; }

    public virtual TaiKhoan? TaiKhoan { get; set; }
}
