using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Chapters
{
    [Authorize(Roles = "Admin")]

    public class DetailsModel : PageModel
    {
        private readonly IChapterRepository _chapterRepository;
        private readonly ISubjectRepository _subjectRepository;
        public DetailsModel(IChapterRepository chapterRepository, ISubjectRepository subjectRepository)
        {
            _chapterRepository = chapterRepository;
            _subjectRepository = subjectRepository;
        }

        public Chapter Chapter { get; set; } = default!;
        public IList<Subject> Subjects { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Chapter = await _chapterRepository.GetChapterById(id.Value);
            Subjects = await _subjectRepository.GetAllSubjects();
            if (Chapter == null || Subjects == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
