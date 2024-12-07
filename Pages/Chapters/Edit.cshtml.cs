using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Chapters
{
    public class EditModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public EditModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Chapter Chapter { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Chapters == null)
            {
                return NotFound();
            }

            var chapter =  await _context.Chapters.FirstOrDefaultAsync(m => m.ChapterId == id);
            if (chapter == null)
            {
                return NotFound();
            }
            Chapter = chapter;
           ViewData["SubId"] = new SelectList(_context.Subjects, "SubjectId", "SubjectId");
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

            _context.Attach(Chapter).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ChapterExists(Chapter.ChapterId))
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

        private bool ChapterExists(int id)
        {
          return (_context.Chapters?.Any(e => e.ChapterId == id)).GetValueOrDefault();
        }
    }
}
