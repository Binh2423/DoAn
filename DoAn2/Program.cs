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
    defaults: new { controller = "Computer", action = "Index" });

    endpoints.MapControllerRoute(
    name: "do-an",
    pattern: "do-an",
    defaults: new { controller = "Food", action = "Index" });

});


app.Run();
