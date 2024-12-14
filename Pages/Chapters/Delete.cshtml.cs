using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Chapters
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
            if (id == null || _context.Chapters == null)
            {
                return NotFound();
            }

            var chapter = await _context.Chapters.FirstOrDefaultAsync(m => m.ChapterId == id);

            if (chapter == null)
            {
                return NotFound();
            }
            else 
            {
                chapter.Active = !chapter.Active;
                _context.Chapters.Update(chapter);
                _context.SaveChanges();
            }
            return RedirectToPage("./Index");
        }

    }
}
