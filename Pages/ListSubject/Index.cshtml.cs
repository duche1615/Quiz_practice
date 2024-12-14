using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.ListSubject
{
    public class IndexModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public IndexModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public List<Subject> Subjects { get; set; }

        public async Task OnGetAsync()
        {
            Subjects = await _context.Subjects
                .Include(s => s.Chapters) 
                .Select(s => new Subject
                {
                    SubjectId = s.SubjectId,
                    SubjectName = s.SubjectName,
                    Title = s.Title,
                    Thumbnail = s.Thumbnail ?? "/images/default.png", 
                    Description = s.Description,
                    Status = s.Status,
                    TagLine = s.Chapters.Count() 
                })
                .ToListAsync();
        }
    }
}
