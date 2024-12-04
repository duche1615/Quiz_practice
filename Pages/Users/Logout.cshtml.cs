using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Quizpractice.Pages.Users
{
    public class LogoutModel : PageModel
    {
        public async Task<IActionResult> OnGetAsync()
        {
            
            await HttpContext.SignOutAsync();  
            HttpContext.Session.Clear();  

            
            return RedirectToPage("/Users/Login");
        }
    }
}
