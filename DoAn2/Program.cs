using DoAn2.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();

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

builder.Services.AddSession();

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

app.UseSession();

app.UseEndpoints(endpoints =>
{


    _ = endpoints.MapControllerRoute(
    name: "trang-chu",
    pattern: "trang-chu",
    defaults: new { controller = "Home", action = "Index" });

    _ = endpoints.MapControllerRoute(
 name: "quan-tri",
 pattern: "quan-tri",
 defaults: new { controller = "Admin", action = "Index" });

    _ = endpoints.MapControllerRoute(
    name: "dang-ky",
    pattern: "dang-ky",
    defaults: new { controller = "User", action = "Register" });

    _ = endpoints.MapControllerRoute(
    name: "dang-nhap",
    pattern: "dang-nhap",
    defaults: new { controller = "User", action = "Login" });

    _ = endpoints.MapControllerRoute(
    name: "dang-xuat",
    pattern: "dang-xuat",
    defaults: new { controller = "User", action = "Logout" });

    _ = endpoints.MapControllerRoute(
    name: "gio-hang",
    pattern: "gio-hang",
    defaults: new { controller = "Cart", action = "Index" });

    _ = endpoints.MapControllerRoute(
    name: "them-gio-hang",
    pattern: "them-gio-hang",
    defaults: new { controller = "Cart", action = "AddItem" });

    _ = endpoints.MapControllerRoute(
    name: "thanh-toan",
    pattern: "thanh-toan",
    defaults: new { controller = "Cart", action = "Payment" });

    _ = endpoints.MapControllerRoute(
    name: "hoan-thanh",
    pattern: "hoan-thanh",
    defaults: new { controller = "Cart", action = "Success" });

    _ = endpoints.MapControllerRoute(
    name: "thong-tin",
    pattern: "thong-tin",
    defaults: new { controller = "User", action = "Info" });


    _ = endpoints.MapControllerRoute(
    name: "may-tinh",
    pattern: "may-tinh",
    defaults: new { controller = "Computer", action = "Index" });

    _ = endpoints.MapControllerRoute(
    name: "do-an",
    pattern: "do-an",
    defaults: new { controller = "Food", action = "Index" });

    _ = endpoints.MapControllerRoute(
    name: "them-do-an",
    pattern: "them-do-an",
    defaults: new { controller = "Food", action = "Add" });




    _ = endpoints.MapControllerRoute(
    name: "{link}",
    pattern: "{link}",
    defaults: new { controller = "Food", action = "CateFood" });




    _ = endpoints.MapControllerRoute(
    name: "{link}",
    pattern: "{link}",
    defaults: new { controller = "Computer", action = "CateCom" });



    _ = endpoints.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
});


app.Run();
