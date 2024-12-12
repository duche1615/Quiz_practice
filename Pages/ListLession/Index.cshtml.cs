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
            // Lấy tất cả các bài học, kèm theo thông tin Subject và Chapter
            Lessions = await _context.Lessions
                .Include(l => l.Chapter) // Load thông tin Chapter
                .Include(l => l.Sub) // Load thông tin Subject
                .ToListAsync();
        }
    }
}
