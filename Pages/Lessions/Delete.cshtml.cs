using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Quizpractice.Pages.Lessions
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
            if (id == null || _context.Lessions == null)
            {
                return NotFound();
            }

            var lession = await _context.Lessions.FirstOrDefaultAsync(m => m.LessionId == id);

            if (lession == null)
            {
                return NotFound();
            }
            else 
            {
                lession.Status = !lession.Status;
                _context.Lessions.Update(lession);
                _context.SaveChanges();
            }
            return RedirectToPage("./Index");
        }

    }
}
