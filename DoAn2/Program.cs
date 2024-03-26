using DoAn2.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var connectionString =
builder.Configuration.GetConnectionString("DoAnWebConnection");
builder.Services.AddDbContext<DoAnWebContext>(options =>
 options.UseSqlServer(connectionString));

builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

    endpoints.MapControllerRoute(
    name: "trang-chu",
    pattern: "trang-chu",
    defaults: new { controller = "Home", action = "Index" });

    endpoints.MapControllerRoute(
    name: "may-tinh",
    pattern: "may-tinh",
    defaults: new { controller = "Computer", action = "Index" });

    endpoints.MapControllerRoute(
    name: "do-an",
    pattern: "do-an",
    defaults: new { controller = "Food", action = "Index" });

    endpoints.MapControllerRoute(
    name: "mon-chinh",
    pattern: "mon-chinh",
    defaults: new { controller = "Food", action = "Mon_Chinh" });

    endpoints.MapControllerRoute(
    name: "nuoc-uong",
    pattern: "nuoc-uong",
    defaults: new { controller = "Food", action = "Nuoc_Uong" });

    endpoints.MapControllerRoute(
    name: "nuoc-pha-che",
    pattern: "nuoc-pha-che",
    defaults: new { controller = "Food", action = "Nuoc_Pha_Che" });

    endpoints.MapControllerRoute(
    name: "do-an-vat",
    pattern: "do-an-vat",
    defaults: new { controller = "Food", action = "Do_An_Vat" });

    endpoints.MapControllerRoute(
    name: "khu-may-7",
    pattern: "khu-may-7",
    defaults: new { controller = "Computer", action = "Khu_7" });

    endpoints.MapControllerRoute(
    name: "khu-may-8",
    pattern: "khu-may-8",
    defaults: new { controller = "Computer", action = "Khu_8" });

    endpoints.MapControllerRoute(
    name: "khu-may-10",
    pattern: "khu-may-10",
    defaults: new { controller = "Computer", action = "Khu_10" });
});


app.Run();
