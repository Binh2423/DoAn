using System;
using System.Collections.Generic;

namespace DoAn2.Models;

public partial class Menu
{
    public string IdMenu { get; set; } = null!;

    public string? Title { get; set; }

    public string? Link { get; set; }

    public bool? Hide { get; set; }
}
