using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class Cttt
{
    public string IdMay { get; set; } = null!;

    public string Sdt { get; set; } = null!;

    public decimal? SoGioDaSuDung { get; set; }

    public DateTime? GioBatDau { get; set; }

    public DateTime? GioKetThuc { get; set; }

    public int? ThanhTien { get; set; }

    public virtual MayTinh IdMayNavigation { get; set; } = null!;

    public virtual TaiKhoan SdtNavigation { get; set; } = null!;
}
