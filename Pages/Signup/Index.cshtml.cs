using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.CodeAnalysis.Scripting;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Signup
{
    public class IndexModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public IndexModel(SWP391_DBContext context)
        {
            _context = context;
        }

        [BindProperty]
        public User NewUser { get; set; }

        public string? ErrorMessage { get; set; }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (NewUser.Password != Request.Form["ConfirmPassword"])
            {
                ErrorMessage = "Mật khẩu và xác nhận mật khẩu không khớp.";
                return Page();
            }

            var existingUser = await _context.Users
                .FirstOrDefaultAsync(u => u.Username == NewUser.Username);

            if (existingUser != null)
            {
                ErrorMessage = "Tên người dùng đã tồn tại.";
                return Page();
            }

            NewUser.Password = BCrypt.Net.BCrypt.HashPassword(NewUser.Password);

            _context.Users.Add(NewUser);
            await _context.SaveChangesAsync();

            return RedirectToPage("/Signin");
        }
    }
}
