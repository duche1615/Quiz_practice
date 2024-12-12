using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Lessions
{
    public class EditModel : PageModel
    {
        private readonly ILessionRepository _lessionRepository;
        private readonly ISubjectRepository _subjectRepository;
        private readonly IChapterRepository _chapterRepository;
        public EditModel(ILessionRepository lessionRepository, ISubjectRepository subjectRepository, IChapterRepository chapterRepository)
        {
            _lessionRepository = lessionRepository;
            _subjectRepository = subjectRepository;
            _chapterRepository = chapterRepository;
        }


        [BindProperty]
        public Lession Lession { get; set; }
        [BindProperty]
        public IList<Subject> Subject { get; set; }
        [BindProperty]
        public IList<Chapter> Chapter { get; set; }


        [BindProperty]
        public int LessionId { get; set; }
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


        public IActionResult OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Lession = _lessionRepository.GetLessionById(id.Value).Result;
            Subject = _subjectRepository.GetAllSubjects().Result;
            Chapter = _chapterRepository.GetAllChapters().Result;
            if (Lession == null || Subject == null || Chapter == null)
            {
                return NotFound();
            }
            ViewData["Subjects"] = Subject;
            ViewData["Chapters"] = Chapter;
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            Lession editedLession = new Lession()
            {
                LessionId = LessionId,
                LessionUrl = LessionUrl,
                Status = Status,
                Title = Title,
                Content = Content,
                Backlink = Backlink,
                Notes = Notes,
                Public = Public,
                Chapterid = Chapterid,
                Subid = Subid
            };
            if (_lessionRepository.UpdateLession(editedLession))
            {
                return RedirectToPage("./Index");

            }
            return Page();
        }

    }
}
