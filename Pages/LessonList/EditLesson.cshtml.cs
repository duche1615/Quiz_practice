using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.LessonList
{
    public class EditLessonModel : PageModel
    {
        private readonly ILessonRepository _lessonRepository;
        private readonly ISubjectRepository _subjectRepository;

        public EditLessonModel(ILessonRepository lessonRepository, ISubjectRepository subjectRepository)
        {
            _lessonRepository = lessonRepository;
            _subjectRepository = subjectRepository;
        }

        [BindProperty]
        public Lesstion Lesson { get; set; }
        public Subject Subject { get; set; }
        public int PackageId { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id, int packageId)
        {
            PackageId = packageId;
            Subject = await _subjectRepository.GetByPackageId(packageId);
            
            if (id == null)
            {
                Lesson = new Lesstion { Subid = Subject.SubjectId }; // New lesson
            }
            else
            {
                Lesson = await _lessonRepository.GetByIdAsync(id.Value);
                if (Lesson == null)
                {
                    return NotFound();
                }
            }

            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int packageIds)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (Lesson.LesstionId == 0) // New Lesson
            {
                await _lessonRepository.AddAsync(Lesson);
            }
            else // Edit existing Lesson
            {
                await _lessonRepository.UpdateAsync(Lesson);
            }

            return RedirectToPage("/LessonList/Index" ,new { packageId = packageIds });
        }
    }
}
