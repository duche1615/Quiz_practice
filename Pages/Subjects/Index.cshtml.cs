using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.EFCore;
using Quizpractice.Models.Entities;

namespace Quizpractice.Pages.Subjects
{
    public class IndexModel : PageModel
    {
        private readonly Quizpractice.Models.EFCore.QuizPracticeContext _context;

        public IndexModel(Quizpractice.Models.EFCore.QuizPracticeContext context)
        {
            _context = context;
        }

        public IList<Subject> Subject { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Subjects != null)
            {
                Subject = await _context.Subjects
                .Include(s => s.Category).ToListAsync();
            }
        }
    }
}
