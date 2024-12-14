using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Users
{
    [Authorize(Roles = "Admin")]
    public class IndexModel : PageModel
    {
        private readonly IUserRepository _userRepository;

        public IndexModel(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public List<User> User { get; set; } = default!;

        public async Task OnGetAsync()
        {
            User = await _userRepository.GetAllUsers();
        }
    }
}
