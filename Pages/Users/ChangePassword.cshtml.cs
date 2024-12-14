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


        public string Layout { get; set; } = "_Layout";
        [BindProperty]
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
            var user = await _userRepository.FindById(Convert.ToInt32(userId));
            if (user == null)
            {
                return RedirectToPage("/Users/Login");
            }
            if (user.Role.RoleName == "Lecturer")
            {
                Layout = "_Layout_Teacher";
            }
            else if (user.Role.RoleName == "Admin")
            {
                Layout = "_Layout_Admin";
            }
            else if (user.Role.RoleName == "learner")
            {
                Layout = "_Layout_Learner";
            }

            return Page();
        }
        public async Task<IActionResult> OnPostAsync()
        {
            var userId = HttpContext.Session.GetString("UserId");
            if (userId == null)
            {
                ModelState.AddModelError("", "User is not logged in.");
                return Page();
            }

            var user = await _userRepository.FindById(int.Parse(userId));
            if (user == null)
            {
                ModelState.AddModelError("", "User not found.");
                return Page();
            }
            // Kiểm tra nếu mật khẩu mới và mật khẩu xác nhận không khớp
            if (ChangePassword.NewPassword != ChangePassword.ConfirmPassword)
            {
                ModelState.AddModelError("", "Passwords do not match.");
                if (user.Role.RoleName == "Lecturer")
                {
                    Layout = "_Layout_Teacher";
                }
                else if (user.Role.RoleName == "Admin")
                {
                    Layout = "_Layout_Admin";
                }
                else if (user.Role.RoleName == "learner")
                {
                    Layout = "_Layout_Learner";
                }
                return Page();
            }
                     
            // Use await to get the result of the task
            var isPasswordValid = await _userRepository.ValidatePassword(user, ChangePassword.OldPassword);

            // Negate the result after awaiting it
            if (!isPasswordValid)
            {
                ModelState.AddModelError("", "Incorrect old password.");
                if (user.Role.RoleName == "Lecturer")
                {
                    Layout = "_Layout_Teacher";
                }
                else if (user.Role.RoleName == "Admin")
                {
                    Layout = "_Layout_Admin";
                }
                else if (user.Role.RoleName == "learner")
                {
                    Layout = "_Layout_Learner";
                }
                return Page();
            }
            if (!ModelState.IsValid)
            {
                if (user.Role.RoleName == "Lecturer")
                {
                    Layout = "_Layout_Teacher";
                }
                else if (user.Role.RoleName == "Admin")
                {
                    Layout = "_Layout_Admin";
                }
                else if (user.Role.RoleName == "learner")
                {
                    Layout = "_Layout_Learner";
                }
                return Page();

            }
            var isUpdated = await _userRepository.UpdatePasswordAsync(user, ChangePassword.NewPassword);
            if (isUpdated)
            {
                if (user.Role.RoleName == "Lecturer")
                {
                    Layout = "_Layout_Teacher";
                }
                else if (user.Role.RoleName == "Admin")
                {
                    Layout = "_Layout_Admin";
                }
                else if (user.Role.RoleName == "learner")
                {
                    Layout = "_Layout_Learner";
                }
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
