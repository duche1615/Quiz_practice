using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Signin
{
    public class IndexModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public IndexModel(SWP391_DBContext context)
        {
            _context = context;
        }

        [BindProperty]
        public User UserLogin { get; set; }

        public string? ErrorMessage { get; set; }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (string.IsNullOrEmpty(UserLogin.Username) || string.IsNullOrEmpty(UserLogin.Password))
            {
                ErrorMessage = "Vui lòng điền đủ thông tin.";
                return Page();
            }

            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.Username == UserLogin.Username);

            if (user == null)
            {
                ErrorMessage = "Tên người dùng không tồn tại.";
                return Page();
            }

            bool isPasswordValid = BCrypt.Net.BCrypt.Verify(UserLogin.Password, user.Password);
            if (!isPasswordValid)
            {
                ErrorMessage = "Mật khẩu không đúng.";
                return Page();
            }

            HttpContext.Session.SetInt32("UserId", user.UserId);
            HttpContext.Session.SetString("Username", user.Username);

            return RedirectToPage("/Index");
        }
    }
}
