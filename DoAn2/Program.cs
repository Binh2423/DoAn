using DoAn2.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.


var connectionString =
builder.Configuration.GetConnectionString("DoAnWebConnection");
builder.Services.AddDbContext<DoAnWebContext>(options =>
 options.UseSqlServer(connectionString));

builder.Services.AddControllersWithViews();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).
AddCookie(options =>
{
    options.Cookie.Name = "PetStoreCookie";
    options.LoginPath = "/User/Login";
});


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

app.UseAuthentication();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    

    endpoints.MapControllerRoute(
    name: "trang-chu",
    pattern: "trang-chu",
    defaults: new { controller = "Home", action = "Index" });

    endpoints.MapControllerRoute(
    name: "dang-ky",
    pattern: "dang-ky",
    defaults: new { controller = "User", action = "Register" });

    endpoints.MapControllerRoute(
    name: "dang-nhap",
    pattern: "dang-nhap",
    defaults: new { controller = "User", action = "Login" });

    endpoints.MapControllerRoute(
    name: "may-tinh",
    pattern: "may-tinh",
    defaults: new { controller = "Computer", action = "Index" });

    endpoints.MapControllerRoute(
    name: "do-an",
    pattern: "do-an",
    defaults: new { controller = "Food", action = "Index" });

    endpoints.MapControllerRoute(
    name: "{link}",
    pattern: "{link}",
    defaults: new { controller = "Food", action = "CateFood" });

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

    endpoints.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
});


app.Run();
