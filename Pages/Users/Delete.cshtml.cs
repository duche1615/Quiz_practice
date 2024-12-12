using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Users
{
    public class DeleteModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public DeleteModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }


        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Users == null)
            {
                return NotFound();
            }

            var user = await _context.Users.FirstOrDefaultAsync(m => m.UserId == id);

            user.Status = !user.Status;
            _context.Users.Update(user);
            _context.SaveChanges();
            return RedirectToPage("./Index");
        }
    }
}
