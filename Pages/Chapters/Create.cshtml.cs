using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Quizpractice.Models;

namespace Quizpractice.Pages.Chapters
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
        ViewData["SubId"] = new SelectList(_context.Subjects, "SubjectId", "SubjectId");
            return Page();
        }

        [BindProperty]
        public Chapter Chapter { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.Chapters == null || Chapter == null)
            {
                return Page();
            }

            _context.Chapters.Add(Chapter);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
