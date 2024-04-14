using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class TaiKhoan
{
    public string Sdt { get; set; } = null!;

    public string MaVt { get; set; } = null!;

    public string? MatKhau { get; set; }

    public bool? Hide { get; set; }

    public int? SoTienTrongTk { get; set; }

    public virtual ICollection<Cttt> Cttts { get; set; } = new List<Cttt>();

    public virtual ICollection<HoaDon> HoaDons { get; set; } = new List<HoaDon>();

    public virtual VaiTro MaVtNavigation { get; set; } = null!;

    public virtual NguoiDung SdtNavigation { get; set; } = null!;
}
