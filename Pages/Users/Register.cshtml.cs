using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Users
{
    public class RegisterModel : PageModel
    {
        private readonly IUserRepository _userRepository;

        public RegisterModel(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [BindProperty]
        public string Email { get; set; }
        [BindProperty]
        public string Password { get; set; }
        [BindProperty]
        public string Fullname { get; set; }
        [BindProperty]
        public string? Phone { get; set; }
        [BindProperty]
        public bool? Gender { get; set; }
        [BindProperty]
        public string? Address { get; set; }

        public string ErrorMessage { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            // Validate inputs
            if (string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password) || string.IsNullOrEmpty(Fullname))
            {
                ErrorMessage = "Email, Password, and Full Name are required.";
                return Page();
            }

            var registerModel = new RegisterViewModel
            {
                Email = Email,
                Password = Password,
                Fullname = Fullname,
                Phone = Phone,
                Gender = Gender,
                Address = Address
            };

            var user = await _userRepository.RegisterUserAsync(registerModel);
            if (user == null)
            {
                ErrorMessage = "This email is already taken.";
                return Page();
            }

            return RedirectToPage("/Users/Login");
        }
    }
}
