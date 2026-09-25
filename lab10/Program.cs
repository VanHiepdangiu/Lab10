using Microsoft.EntityFrameworkCore;
using lab10.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllersWithViews();
var useInMemory = builder.Configuration.GetValue<bool>("UseInMemoryDatabase");
var connectionString = builder.Configuration.GetConnectionString("TvcLesson10EfConnectionString");
builder.Services.AddDbContext<TvcLesson10EfdbContext>(options =>
{
    if (useInMemory) options.UseInMemoryDatabase("Lab10DemoDb");
    else options.UseSqlServer(connectionString);
});
var app = builder.Build();
if (!app.Environment.IsDevelopment()) { app.UseExceptionHandler("/Home/Error"); app.UseHsts(); }
app.UseHttpsRedirection(); app.UseStaticFiles(); app.UseRouting(); app.UseAuthorization();
// Dữ liệu demo để project chạy ngay trên máy không có SQL Server.
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<TvcLesson10EfdbContext>();
    db.Database.EnsureCreated();
    if (!db.TvcMembers.Any())
    {
        db.TvcMembers.AddRange(
            new TvcMember { TvcUserName="nguyenvanhiep", TvcPassword="123456", TvcFullName="Nguyễn Văn Hiệp - 2410900035", TvcEmail="hiep2410900035@gmail.com", TvcPhone="0988089376", TvcStatus=true },
            new TvcMember { TvcUserName="tranthib", TvcPassword="123456", TvcFullName="Trần Thị Bình", TvcEmail="tranthib@example.com", TvcPhone="0901234567", TvcStatus=true }
        );
        db.SaveChanges();
    }
}
app.MapControllerRoute(name:"default",pattern:"{controller=Home}/{action=Index}/{id?}");
app.Run();
