using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;

namespace Quizpractice.Pages.UserProfile
{
    public class IndexModel : PageModel
    {
        private readonly SWP391_DBContext _context;
        private readonly IWebHostEnvironment _env;

        public IndexModel(SWP391_DBContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        [BindProperty]
        public User User { get; set; }

        [BindProperty]
        public string CurrentPassword { get; set; }

        [BindProperty]
        public string NewPassword { get; set; }

        [BindProperty]
        public string ConfirmNewPassword { get; set; }

        public string ErrorMessage { get; set; }

        public void OnGet()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            User = _context.Users.FirstOrDefault(u => u.UserId == userId);
        }

        public IActionResult OnPost()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

            if (user != null)
            {
                user.Fullname = User.Fullname;
                user.Phone = User.Phone;
                user.Gender = User.Gender;
                user.Address = User.Address;

                if (Request.Form.Files.Count > 0)
                {
                    var file = Request.Form.Files[0];
                    if (file.Length > 0)
                    {
                        var filePath = Path.Combine(_env.WebRootPath, "images", file.FileName);

                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        user.Avatar = "/images/avatar" + file.FileName;
                    }
                }

                _context.SaveChanges();

                ErrorMessage = "Thay đổi thông tin thành công!";
                return Page();
            }

            return Page();
        }

        public IActionResult OnPostChangePassword()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            var user = _context.Users.FirstOrDefault(u => u.UserId == userId);

            if (user != null)
            {
                if (!BCrypt.Net.BCrypt.Verify(CurrentPassword, user.Password))
                {
                    ErrorMessage = "Mật khẩu hiện tại không đúng.";
                    return Page();
                }

                if (NewPassword != ConfirmNewPassword)
                {
                    ErrorMessage = "Mật khẩu mới và mật khẩu xác nhận không khớp.";
                    return Page();
                }

                user.Password = BCrypt.Net.BCrypt.HashPassword(NewPassword);
                _context.SaveChanges();

                ErrorMessage = "Thay đổi mật khẩu thành công!";
                return Page();
            }

            return Page();
        }
    }
}
