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
    public class DetailsModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public DetailsModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

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
    }
}
