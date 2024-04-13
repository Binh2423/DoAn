using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class Loai
{
    public string MaLoai { get; set; } = null!;

    public string? TenLoai { get; set; }

    public bool? Hide { get; set; }

    public string? Link { get; set; }

    public virtual ICollection<MayTinh> MayTinhs { get; set; } = new List<MayTinh>();

    public virtual ICollection<ThucPham> ThucPhams { get; set; } = new List<ThucPham>();
}
