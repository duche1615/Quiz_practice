using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Subjects
{
    public class CreateModel : PageModel
    {
        private readonly ISubjectRepository _subjectRepository;
        public CreateModel(ISubjectRepository subjectRepository)
        {
            _subjectRepository = subjectRepository;
        }

        [BindProperty]
        public Subject Subject { get; set; } = default!;
        [BindProperty]
        public int Id { get; set; } = default;
        [BindProperty]
        public string SubjectName { get; set; } = default!;
        [BindProperty]
        public bool Status { get; set; } = default;
        [BindProperty]
        public string Title { get; set; } = default!;
        [BindProperty]
        public string Thumbnail { get; set; } = default!;
        [BindProperty]
        public string Description { get; set; } = default!;


        public IActionResult OnGetAsync()
        {
            return Page();
        }


        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public IActionResult OnPostAsync()
        {
            Subject = new Subject()
            {
                SubjectId = 0,
                SubjectName = SubjectName,
                Status = Status,
                TagLine = null,
                Thumbnail = Thumbnail,
                Description = Description,
                Title = Title,
            };
            if (!_subjectRepository.CreateSubject(Subject))
            {
                return Page();
            }

            return RedirectToPage("./Index");
        }
    }
}
