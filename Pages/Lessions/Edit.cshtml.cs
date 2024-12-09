using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Lessions
{
    public class EditModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public EditModel(Quizpractice.Models.SWP391_DBContext context)
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

            var lession =  await _context.Lessions.FirstOrDefaultAsync(m => m.LessionId == id);
            if (lession == null)
            {
                return NotFound();
            }
            Lession = lession;
           ViewData["Chapterid"] = new SelectList(_context.Chapters, "ChapterId", "ChapterId");
           ViewData["Subid"] = new SelectList(_context.Subjects, "SubjectId", "SubjectId");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Lession).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LessionExists(Lession.LessionId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool LessionExists(int id)
        {
          return (_context.Lessions?.Any(e => e.LessionId == id)).GetValueOrDefault();
        }
    }
}
