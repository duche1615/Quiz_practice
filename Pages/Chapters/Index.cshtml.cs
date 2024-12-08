using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.Chapters
{
    public class IndexModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public IndexModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        public IList<Chapter> Chapter { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Chapters != null)
            {
                Chapter = await _context.Chapters
                .Include(c => c.Sub).ToListAsync();
            }
        }
    }
}
