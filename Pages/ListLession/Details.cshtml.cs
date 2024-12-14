using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.ListLession
{
    public class DetailsModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public DetailsModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public Lession Lession { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            
            Lession = await _context.Lessions
                .Include(l => l.Chapter) 
                .Include(l => l.Sub) 
                .FirstOrDefaultAsync(m => m.LessionId == id);

            if (Lession == null)
            {
                return NotFound();
            }

            return Page();
        }
    }
}
