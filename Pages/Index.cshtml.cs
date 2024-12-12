using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Http;

namespace Quizpractice.Pages
{
    public class IndexModel : PageModel
    {

        // Thêm một thuộc tính để lưu tên người dùng
        public string? UserName { get; set; }

        public IActionResult OnGet()
        {
            // Kiểm tra xem người dùng có đăng nhập hay không
            var userId = HttpContext.Session.GetString("UserId");
            if (string.IsNullOrEmpty(userId))
            {
                // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang Login
                return RedirectToPage("/HomePage/Index");
            }

            // Nếu người dùng đã đăng nhập, lấy thông tin người dùng từ session hoặc DB
            UserName = HttpContext.Session.GetString("UserName");

            // Bạn có thể thêm logic lấy dữ liệu người dùng từ cơ sở dữ liệu nếu cần
            return Page();
        }
    }
}