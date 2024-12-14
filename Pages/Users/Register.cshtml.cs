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
        public RegisterViewModel RegisterViewModel { get; set; }

        

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            // check if email exists
            var emailExists = await _userRepository.CheckEmailExistAsync(RegisterViewModel.Email);
            if (emailExists)
            {
                ModelState.AddModelError("", "This email is already taken.");
                return Page();
            }
            if (RegisterViewModel.Password != RegisterViewModel.RePassword)
            {
                ModelState.AddModelError("", "Passwords do not match.");
                return Page();
            }
            // register user
            var user = await _userRepository.RegisterUserAsync(RegisterViewModel);
            if (user == null)
            {
                ModelState.AddModelError("", "Failed to register user.");
                return Page();
            }

            return RedirectToPage("/Users/Login");
        }
    }
}
