using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class ThucPham
{
    public int MaTp { get; set; }

    public string MaLoai { get; set; } = null!;

    public string? TenTp { get; set; }

    public int? GiaTp { get; set; }

    public short? SoLuong { get; set; }

    public string? HinhAnh { get; set; }

    public int? Order { get; set; }

    public bool? Hide { get; set; }

    public virtual ICollection<Cthd> Cthds { get; set; } = new List<Cthd>();

    public virtual Loai MaLoaiNavigation { get; set; } = null!;
}
