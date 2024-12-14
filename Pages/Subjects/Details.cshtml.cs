using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Subjects
{
    [Authorize(Roles = "Admin")]

    public class DetailsModel : PageModel
    {
        private readonly ISubjectRepository _subjectRepository;
        private readonly IChapterRepository _chapterRepository;
        public DetailsModel(ISubjectRepository subjectRepository, IChapterRepository chapterRepository)
        {
            _subjectRepository = subjectRepository;
            _chapterRepository = chapterRepository;
        }
        public Subject Subject { get; set; } = default!;
        public List<Chapter> Chapters { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var subject = await _subjectRepository.GetById(id.Value);
            if (subject == null)
            {
                return NotFound();
            }
            else
            {
                var chapters = await _chapterRepository.GetAllChaptersBySubjectId(id.Value);
                if (chapters == null)
                {
                    return NotFound();
                }
                else
                {
                    Chapters= chapters;
                }
                Subject = subject;
            }
            return Page();
        }
    }
}
