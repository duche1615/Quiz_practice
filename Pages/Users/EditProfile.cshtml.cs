using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Users
{
    public class EditProfileModel : PageModel
    {
        private readonly IUserRepository _userRepository;
        public EditProfileModel(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [BindProperty]
        public User Users { get; set; }

        public string Layout { get; set; } = "_Layout";

        public async Task<IActionResult> OnGetAsync()
        {
            var userIdString = HttpContext.Session.GetString("UserId");

            if (string.IsNullOrEmpty(userIdString))
            {
                return RedirectToPage("/Users/Login");
            }
            Users = await _userRepository.FindById(Convert.ToInt32(userIdString));
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
                Layout = "_AdminLayout";
            }
            else
            {
                Layout = "_Layout";
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var userIdString = HttpContext.Session.GetString("UserId");

            if (userIdString == null)
            {
                ModelState.AddModelError("", "Error.");
                return RedirectToPage("/Users/Login");
            }

            
                Users = await _userRepository.FindById(Convert.ToInt32(userIdString));
                if (Users == null)
                {
                ModelState.AddModelError("", "Error.");
                return Page();
                }

                // Update user profile fields
                Users.Fullname = Request.Form["Fullname"];
                Users.Phone = Request.Form["Phone"];
                Users.Address = Request.Form["Address"];
                Users.Gender = Convert.ToBoolean(Request.Form["Gender"]);
                // Save changes
                await _userRepository.UpdateAsync(Users);

                
            

            return RedirectToPage("Profile");
        }
    }
}

