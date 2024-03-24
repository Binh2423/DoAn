using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class Cthd
{
    public byte[] SoHd { get; set; } = null!;

    public string MaTp { get; set; } = null!;

    public short? SoLuong { get; set; }

    public virtual ThucPham MaTpNavigation { get; set; } = null!;

    public virtual HoaDon SoHdNavigation { get; set; } = null!;
}
