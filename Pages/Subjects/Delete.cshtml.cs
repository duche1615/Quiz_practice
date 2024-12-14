using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Quizpractice.Pages.Subjects
{
    [Authorize(Roles = "Admin")]

    public class DeleteModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public DeleteModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Subjects == null)
            {
                return NotFound();
            }

            var subject = await _context.Subjects.FirstOrDefaultAsync(m => m.SubjectId == id);

            if (subject == null)
            {
                return NotFound();
            }
            else 
            {
                subject.Status = !subject.Status;
                _context.Subjects.Update(subject);
                _context.SaveChanges();
            }
            return RedirectToPage("./Index");
        }

    }
}
