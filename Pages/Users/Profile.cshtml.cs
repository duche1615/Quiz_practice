using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Users
{
    public class ProfileModel : PageModel
    {
        private readonly IUserRepository _userRepository;
        public ProfileModel(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        [BindProperty]
        public User Users { get; set; }
        public string Layout { get; set; } = "_Layout";
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
            if (Users.Role.RoleName == "Lecture")
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
    }
}
