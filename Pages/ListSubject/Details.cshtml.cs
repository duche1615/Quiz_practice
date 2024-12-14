using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.ListSubject
{
    public class DetailsModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public DetailsModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public Subject Subject { get; set; }
        public IList<Chapter> Chapters { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Subject = await _context.Subjects
                .Include(s => s.Chapters)
                .FirstOrDefaultAsync(m => m.SubjectId == id);

            if (Subject == null)
            {
                return NotFound();
            }

            
            Chapters = await _context.Chapters
                .Where(c => c.SubId == id)
                .ToListAsync();

            return Page();
        }
    }
}
