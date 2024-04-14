using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class HoaDon
{
    public int SoHd { get; set; }

    public string Sdt { get; set; } = null!;

    public int? TongTien { get; set; }

    public DateTime? NgayThanhToan { get; set; }

    public virtual ICollection<Cthd> Cthds { get; set; } = new List<Cthd>();

    public virtual TaiKhoan SdtNavigation { get; set; } = null!;
}
