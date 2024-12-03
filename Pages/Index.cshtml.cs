using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Http;

namespace Quizpractice.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        // Thêm một thuộc tính để lưu tên người dùng
        public string? UserName { get; set; }

        public void OnGet()
        {
            // Lấy tên người dùng từ session
            UserName = HttpContext.Session.GetString("Username");
        }
    }
}