using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DoAn2.Models;

public partial class DoAnWebContext : DbContext
{
    public DoAnWebContext()
    {
    }

    public DoAnWebContext(DbContextOptions<DoAnWebContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Cthd> Cthds { get; set; }

    public virtual DbSet<Cttt> Cttts { get; set; }

    public virtual DbSet<HoaDon> HoaDons { get; set; }

    public virtual DbSet<Loai> Loais { get; set; }

    public virtual DbSet<MayTinh> MayTinhs { get; set; }

    public virtual DbSet<Menu> Menus { get; set; }

    public virtual DbSet<NguoiDung> NguoiDungs { get; set; }

    public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }

    public virtual DbSet<ThucPham> ThucPhams { get; set; }

    public virtual DbSet<VaiTro> VaiTros { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=AURORA;Database=DoAnWeb;Trusted_Connection=True;TrustServerCertificate=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cthd>(entity =>
        {
            entity.HasKey(e => new { e.SoHd, e.MaTp }).HasName("PK__CTHD__7E4EFB5060D60250");

            entity.ToTable("CTHD");

            entity.Property(e => e.SoHd).HasColumnName("SoHD");
            entity.Property(e => e.MaTp).HasColumnName("MaTP");

            entity.HasOne(d => d.MaTpNavigation).WithMany(p => p.Cthds)
                .HasForeignKey(d => d.MaTp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CTHD__MaTP__48CFD27E");

            entity.HasOne(d => d.SoHdNavigation).WithMany(p => p.Cthds)
                .HasForeignKey(d => d.SoHd)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CTHD__SoHD__49C3F6B7");
        });

        modelBuilder.Entity<Cttt>(entity =>
        {
            entity.HasKey(e => new { e.IdMay, e.Sdt }).HasName("PK_CTTT_1");

            entity.ToTable("CTTT");

            entity.Property(e => e.Sdt)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("SDT");
            entity.Property(e => e.GioBatDau).HasColumnType("datetime");
            entity.Property(e => e.GioKetThuc).HasColumnType("datetime");
            entity.Property(e => e.SoGioDaSuDung).HasColumnType("decimal(5, 2)");

            entity.HasOne(d => d.IdMayNavigation).WithMany(p => p.Cttts)
                .HasForeignKey(d => d.IdMay)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CTTT__IdMay__4AB81AF0");

            entity.HasOne(d => d.SdtNavigation).WithMany(p => p.Cttts)
                .HasForeignKey(d => d.Sdt)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__CTTT__SDT__4BAC3F29");
        });

        modelBuilder.Entity<HoaDon>(entity =>
        {
            entity.HasKey(e => e.SoHd).HasName("PK__HoaDon__BC3CAB57E819ABE1");

            entity.ToTable("HoaDon");

            entity.Property(e => e.SoHd).HasColumnName("SoHD");
            entity.Property(e => e.NgayThanhToan).HasColumnType("datetime");
            entity.Property(e => e.Sdt)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("SDT");

            entity.HasOne(d => d.SdtNavigation).WithMany(p => p.HoaDons)
                .HasForeignKey(d => d.Sdt)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HoaDon_TaiKhoan");
        });

        modelBuilder.Entity<Loai>(entity =>
        {
            entity.HasKey(e => e.MaLoai).HasName("PK__LoaiThuc__730A5759D6FDEB76");

            entity.ToTable("Loai");

            entity.Property(e => e.MaLoai)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Link)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.TenLoai).HasMaxLength(30);
        });

        modelBuilder.Entity<MayTinh>(entity =>
        {
            entity.HasKey(e => e.IdMay).HasName("PK__MayTinh__0D13B75997AD6F61");

            entity.ToTable("MayTinh");

            entity.Property(e => e.HinhAnh).HasMaxLength(100);
            entity.Property(e => e.MaLoai)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.TenMay).HasMaxLength(30);

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.MayTinhs)
                .HasForeignKey(d => d.MaLoai)
                .HasConstraintName("FK_MayTinh_Loai");
        });

        modelBuilder.Entity<Menu>(entity =>
        {
            entity.HasKey(e => e.IdMenu).HasName("PK__Menu__4D7EA8E15A0A2735");

            entity.ToTable("Menu");

            entity.Property(e => e.IdMenu)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Link)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Title).HasMaxLength(50);
        });

        modelBuilder.Entity<NguoiDung>(entity =>
        {
            entity.HasKey(e => e.Sdt).HasName("PK__NguoiDun__CA1930A4D2BB6D1C");

            entity.ToTable("NguoiDung");

            entity.Property(e => e.Sdt)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("SDT");
            entity.Property(e => e.DiaChi).HasMaxLength(100);
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.HoTen).HasMaxLength(60);
            entity.Property(e => e.NgaySinh).HasColumnType("datetime");
        });

        modelBuilder.Entity<TaiKhoan>(entity =>
        {
            entity.HasKey(e => e.Sdt).HasName("PK__TaiKhoan__CA1930A4997D07E6");

            entity.ToTable("TaiKhoan");

            entity.Property(e => e.Sdt)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("SDT");
            entity.Property(e => e.MaVt)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("MaVT");
            entity.Property(e => e.MatKhau)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.SoTienTrongTk).HasColumnName("SoTienTrongTK");

            entity.HasOne(d => d.MaVtNavigation).WithMany(p => p.TaiKhoans)
                .HasForeignKey(d => d.MaVt)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TaiKhoan__MaVT__4D94879B");

            entity.HasOne(d => d.SdtNavigation).WithOne(p => p.TaiKhoan)
                .HasForeignKey<TaiKhoan>(d => d.Sdt)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TaiKhoan__SDT__4E88ABD4");
        });

        modelBuilder.Entity<ThucPham>(entity =>
        {
            entity.HasKey(e => e.MaTp).HasName("PK__ThucPham__2725007D94D93315");

            entity.ToTable("ThucPham");

            entity.Property(e => e.MaTp).HasColumnName("MaTP");
            entity.Property(e => e.GiaTp).HasColumnName("GiaTP");
            entity.Property(e => e.HinhAnh)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.MaLoai)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.TenTp)
                .HasMaxLength(30)
                .HasColumnName("TenTP");

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.ThucPhams)
                .HasForeignKey(d => d.MaLoai)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ThucPham__MaLoai__4F7CD00D");
        });

        modelBuilder.Entity<VaiTro>(entity =>
        {
            entity.HasKey(e => e.MaVt).HasName("PK__VaiTro__2725103E82547C4D");

            entity.ToTable("VaiTro");

            entity.Property(e => e.MaVt)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("MaVT");
            entity.Property(e => e.TenVt)
                .HasMaxLength(20)
                .HasColumnName("TenVT");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
