using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;
using System.Security.Claims;

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
        public LoginViewModel LoginViewModel { get; set; } = new();

        public async Task<IActionResult> OnPostAsync()
        {
            // Validate inputs
            if (string.IsNullOrEmpty(LoginViewModel.Email) || string.IsNullOrEmpty(LoginViewModel.Password))
            {
                ModelState.AddModelError("", "Email and Password are required.");
                return Page();
            }

            var user = await _userRepository.LoginAsync(LoginViewModel);

            if (user == null)
            {
                ModelState.AddModelError("", "Invalid email or password.");
                return Page();
            }

            
            HttpContext.Session.SetString("UserId", user.UserId.ToString());
            HttpContext.Session.SetString("Role", user.RoleId.ToString());
            ViewData["Role"] = user.RoleId.ToString();
            var claims = new List<Claim>
{
    new Claim(ClaimTypes.Role, user.Role.RoleName) // Lưu thông tin vai trò vào claims
};

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimsPrincipal);

            // Redirect based on role
            if (user.RoleId == 1) // Admin
            {
                return RedirectToPage("/Users/Index");
            }
            else if (user.RoleId == 2) // Learner
            {
                return RedirectToPage("/Home/Index");
            }
            else if (user.RoleId == 3) // Lecturer
            {
                return RedirectToPage("/Teacher/Questions/Index");
            }
            
            // Login is successful, redirect to home page or dashboard
            return RedirectToPage("/Index");
        }
    }
}

