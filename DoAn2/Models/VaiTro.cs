using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class VaiTro
{
    public string MaVt { get; set; } = null!;

    public string? TenVt { get; set; }

    public virtual ICollection<TaiKhoan> TaiKhoans { get; set; } = new List<TaiKhoan>();
}
