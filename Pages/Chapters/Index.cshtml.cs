using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Chapters
{
    [Authorize(Roles = "Admin")]

    public class IndexModel : PageModel
    {
        private readonly IChapterRepository _chapterRepository;
        private readonly ISubjectRepository _subjectRepository;
        public IndexModel(IChapterRepository chapterRepository, ISubjectRepository subjectRepository)
        {
            _chapterRepository = chapterRepository;
            _subjectRepository = subjectRepository;
        }

        public IList<Chapter> Chapter { get; set; } = default!;
        public IList<Subject> Subject { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync()
        {
            Chapter = await _chapterRepository.GetAllChapters();
            Subject = await _subjectRepository.GetAllSubjects();
            if (Chapter == null || Subject == null)
            {
                return NotFound();
            }

            return Page();

        }
    }
}
