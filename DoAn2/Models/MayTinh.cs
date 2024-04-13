using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class MayTinh
{
    public string IdMay { get; set; } = null!;

    public string? TenMay { get; set; }

    public int? Gia { get; set; }

    public bool? TrangThai { get; set; }

    public string? HinhAnh { get; set; }

    public bool? BiHong { get; set; }

    public int? Order { get; set; }

    public bool? Hide { get; set; }

    public string? MaLoai { get; set; }

    public virtual ICollection<Cttt> Cttts { get; set; } = new List<Cttt>();

    public virtual ICollection<HoaDon> HoaDons { get; set; } = new List<HoaDon>();

    public virtual Loai? MaLoaiNavigation { get; set; }
}
