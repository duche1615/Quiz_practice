using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Subjects
{
    public class EditModel : PageModel
    {
        private readonly ISubjectRepository _subjectRepository;
        public EditModel(ISubjectRepository subjectRepository )
        {
            _subjectRepository = subjectRepository;
        }

        [BindProperty]
        public Subject Subject { get; set; } = default!;
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Subject sub = await _subjectRepository.GetById(id.Value);
            if (sub == null)
            {
                return NotFound();
            }
            else
            {
                Subject = sub;
            }
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            return Page();
        }
    }
}
