using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Users
{
    public class LoginModel : PageModel
    {
        private readonly IUserRepository _userRepository;

        public LoginModel(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [BindProperty]
        public string Email { get; set; }

        [BindProperty]
        public string Password { get; set; }

        public string ErrorMessage { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            // Validate inputs
            if (string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password))
            {
                ErrorMessage = "Email and Password are required.";
                return Page();
            }

            var loginModel = new LoginViewModel
            {
                Email = Email,
                Password = Password
            };

            var user = await _userRepository.LoginAsync(loginModel);

            if (user == null)
            {
                ErrorMessage = "Invalid email or password.";
                return Page();
            }
            HttpContext.Session.SetString("UserId", user.UserId.ToString());
            HttpContext.Session.SetString("Role", user.RoleId.ToString());
            ViewData["Role"] = user.RoleId.ToString();

            // Redirect based on role
            if (user.RoleId == 1) // Admin
            {
                return RedirectToPage("/Admin/Index");
            }
            else if (user.RoleId == 2) // Learner
            {
                return RedirectToPage("/Quizs/Index");
            }
            else if (user.RoleId == 3) // Teacher
            {
                return RedirectToPage("/Teacher/Questions/Index");
            }
            else if (user.RoleId == 4) // Sale
            {
                return RedirectToPage("/Sale/Index");
            }
            // Login is successful, redirect to home page or dashboard
            return RedirectToPage("/Index");
        }
    }
}

