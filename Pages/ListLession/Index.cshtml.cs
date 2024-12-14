using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.ListLession
{
    public class IndexModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public IndexModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public IList<Lession> Lessions { get; set; }

        public async Task OnGetAsync()
        {
          
            Lessions = await _context.Lessions
                .Include(l => l.Chapter) 
                .Include(l => l.Sub) 
                .ToListAsync();
        }
    }
}
