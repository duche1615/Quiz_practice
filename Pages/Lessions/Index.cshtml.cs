using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Lessions
{
    public class IndexModel : PageModel
    {
        private readonly ILessionRepository _lessionRepository;
        private readonly ISubjectRepository _subjectRepository;
        private readonly IChapterRepository _chapterRepository;
        public IndexModel(ILessionRepository lessionRepository, ISubjectRepository subjectRepository, IChapterRepository chapterRepository)
        {
            _lessionRepository = lessionRepository;
            _subjectRepository = subjectRepository;
            _chapterRepository = chapterRepository;
        }
        [BindProperty]
        public IList<Lession> Lession { get; set; }
        [BindProperty]
        public IList<Subject> Subject { get; set; }
        [BindProperty]
        public IList<Chapter> Chapter { get; set; }

        public IActionResult OnGetAsync()
        {
            Lession = _lessionRepository.GetAllLessions().Result;
            Subject = _subjectRepository.GetAllSubjects().Result;
            Chapter = _chapterRepository.GetAllChapters().Result;
            if (Lession == null || Subject == null || Chapter == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
