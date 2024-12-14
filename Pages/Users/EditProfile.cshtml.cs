using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;

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
        public EditProfileViewModel EditProfile { get; set; }

        public string Layout { get; set; } = "_Layout";

        public async Task<IActionResult> OnGetAsync()
        {
            var userIdString = HttpContext.Session.GetString("UserId");

            if (string.IsNullOrEmpty(userIdString))
            {
                return RedirectToPage("/Users/Login");
            }
            var user = await _userRepository.FindById(Convert.ToInt32(userIdString));
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

            EditProfile = new EditProfileViewModel
            {
                Fullname = user.Fullname,
                Phone = user.Phone,
                Address = user.Address,
                Gender = user.Gender
            };
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

            
            var user = await _userRepository.FindById(Convert.ToInt32(userIdString));
            if (user == null)
            {
                ModelState.AddModelError("", "User not found.");
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
                }else if (user.Role.RoleName == "Learner")
                {
                    Layout = "_Layout_Learner";
                }

                return Page();
            }
            // Update user data from ViewModel
            user.Fullname = EditProfile.Fullname;
            user.Phone = EditProfile.Phone;
            user.Address = EditProfile.Address;
            user.Gender = EditProfile.Gender;

            // Save changes
            await _userRepository.UpdateAsync(user);

            return RedirectToPage("/Users/Profile");

        }
    }
}

