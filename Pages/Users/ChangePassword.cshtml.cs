using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;
using System.Threading.Tasks;

namespace Quizpractice.Pages.Users
{
    public class ChangePasswordModel : PageModel
    {
        private readonly IUserRepository _userRepository;

        public ChangePasswordModel(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [BindProperty]
        public User Users { get; set; }
        public string Layout { get; set; } = "_Layout";
        public ChangePasswordViewModel ChangePassword { get; set; }

        public string ErrorMessage { get; set; }
        public string SuccessMessage { get; set; }

        public async Task<IActionResult> OnGetAsync()
        {
            var userId = HttpContext.Session.GetString("UserId");
            if (string.IsNullOrEmpty(userId))
            {
                return RedirectToPage("/Users/Login");
            }

            // Fetch user details using the ID
            Users = await _userRepository.FindById(Convert.ToInt32(userId));
            if (Users == null)
            {
                return RedirectToPage("/Users/Login");
            }
            if (Users.Role.RoleName == "Lecturer")
            {
                Layout = "_Layout_Teacher";
            }
            else if (Users.Role.RoleName == "Admin")
            {
                Layout = "_Layout_Admin";
            }
            else
            {
                Layout = "_Layout";
            }
            return Page();
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if (string.IsNullOrEmpty(ChangePassword.OldPassword) ||
        string.IsNullOrEmpty(ChangePassword.NewPassword) ||
        string.IsNullOrEmpty(ChangePassword.ConfirmPassword))
            {
                ModelState.AddModelError("", "All fields are required.");
                return Page();
            }

            // Kiểm tra nếu mật khẩu mới và mật khẩu xác nhận không khớp
            if (ChangePassword.NewPassword != ChangePassword.ConfirmPassword)
            {
                ModelState.AddModelError("", "Passwords do not match.");
                return Page();
            }

            var userId = HttpContext.Session.GetString("UserId");
            if (userId == null)
            {
                ModelState.AddModelError("", "User is not logged in.");
                return Page();
            }

            var user = await _userRepository.GetByIdAsync(int.Parse(userId));
            if (user == null)
            {
                ModelState.AddModelError("", "User not found.");
                return Page();
            }

            // Use await to get the result of the task
            var isPasswordValid = await _userRepository.ValidatePassword(user, ChangePassword.OldPassword);

            // Negate the result after awaiting it
            if (!isPasswordValid)
            {
                ModelState.AddModelError("", "Incorrect old password.");
                return Page();
            }

            var isUpdated = await _userRepository.UpdatePasswordAsync(user, ChangePassword.NewPassword);
            if (isUpdated)
            {
                SuccessMessage = "Password changed successfully.";
            }
            else
            {
                ModelState.AddModelError("", "Error updating password.");
            }

            
            
            return Page();
        }
    }
}
