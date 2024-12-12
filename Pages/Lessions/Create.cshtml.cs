using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Lessions
{
    public class CreateModel : PageModel
    {
        private readonly ILessionRepository _lessionRepository;
        private readonly ISubjectRepository _subjectRepository;
        private readonly IChapterRepository _chapterRepository;
        public CreateModel(ISubjectRepository subjectRepository, IChapterRepository chapterRepository, ILessionRepository lessionRepository)
        {
            _subjectRepository = subjectRepository;
            _chapterRepository = chapterRepository;
            _lessionRepository = lessionRepository;
        }


        [BindProperty]
        public Lession Lession { get; set; }
        [BindProperty]
        public IList<Subject> Subject { get; set; }
        [BindProperty]
        public IList<Chapter> Chapter { get; set; }

        [BindProperty]
        public int Subid { get; set; }
        [BindProperty]
        public int Chapterid { get; set; }
        [BindProperty]
        public string LessionUrl { get; set; }
        [BindProperty]
        public bool Status { get; set; }
        [BindProperty]
        public bool Public { get; set; }
        [BindProperty]
        public String Title { get; set; }
        [BindProperty]
        public String Content { get; set; }
        [BindProperty]
        public String Backlink { get; set; }
        [BindProperty]
        public String Notes { get; set; }


        public IActionResult OnGetAsync()
        {
            Subject = _subjectRepository.GetAllSubjects().Result;
            Chapter = _chapterRepository.GetAllChapters().Result;
            if (Subject == null || Chapter == null)
            {
                return NotFound();
            }
            Lession = new Lession();
            Lession.Subid = 1;
            ViewData["Subjects"] = Subject;
            ViewData["Chapters"] = Chapter;
            return Page();
        }



        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            Lession newLession = new Lession()
            {
                LessionId = 0,
                LessionUrl = LessionUrl,
                Status = Status,
                Title = Title,
                Content = Content,
                Backlink = Backlink,
                Notes = Notes,
                Subid = Subid,
                Public = Public,
                Chapterid = Chapterid
            };
            if (!_lessionRepository.CreateLession(newLession))
            {
                return Page();
            }

            return RedirectToPage("./Index");
        }
    }
}
