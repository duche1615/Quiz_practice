using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Quizpractice.Models;

namespace Quizpractice.Pages.Lessions
{
    public class CreateModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public CreateModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["Chapterid"] = new SelectList(_context.Chapters, "ChapterId", "ChapterId");
        ViewData["Subid"] = new SelectList(_context.Subjects, "SubjectId", "SubjectId");
            return Page();
        }

        [BindProperty]
        public Lession Lession { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.Lessions == null || Lession == null)
            {
                return Page();
            }

            _context.Lessions.Add(Lession);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
