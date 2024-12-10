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
    public class IndexModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public IndexModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        public IList<Lession> Lession { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Lessions != null)
            {
                Lession = await _context.Lessions
                .Include(l => l.Chapter)
                .Include(l => l.Sub).ToListAsync();
            }
        }
    }
}
