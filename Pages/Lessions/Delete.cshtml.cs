using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Lessions
{
    public class DeleteModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public DeleteModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        [BindProperty]
      public Lession Lession { get; set; } = default!;

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
                Lession = lession;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.Lessions == null)
            {
                return NotFound();
            }
            var lession = await _context.Lessions.FindAsync(id);

            if (lession != null)
            {
                Lession = lession;
                _context.Lessions.Remove(Lession);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
