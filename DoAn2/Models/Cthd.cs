﻿using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class Cthd
{
    public int SoHd { get; set; }

    public int MaTp { get; set; }

    public int? SoLuong { get; set; }

    public virtual ThucPham MaTpNavigation { get; set; } = null!;

    public virtual HoaDon SoHdNavigation { get; set; } = null!;
}
