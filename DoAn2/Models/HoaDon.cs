using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class HoaDon
{
    public byte[] SoHd { get; set; } = null!;

    public string IdMay { get; set; } = null!;

    public int? TongTien { get; set; }

    public DateTime? NgayThanhToan { get; set; }

    public virtual ICollection<Cthd> Cthds { get; set; } = new List<Cthd>();

    public virtual MayTinh IdMayNavigation { get; set; } = null!;
}
