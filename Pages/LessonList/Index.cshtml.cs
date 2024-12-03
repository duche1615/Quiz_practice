using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.LessonList
{
    public class IndexModel : PageModel
    {
        private readonly ILessonRepository _lessonRepository;

        public IndexModel(ILessonRepository lessonRepository)
        {
            _lessonRepository = lessonRepository;
        }

        public int PackageId { get; set; }
        public IEnumerable<Lesstion> Lessons { get; set; }

        public async Task<IActionResult> OnGetAsync(int packageId)
        {
            PackageId = packageId;
            Console.WriteLine(PackageId);
            Lessons = await _lessonRepository.GetLessonsByPackageIdAsync(packageId);
            return Page();
        }

        public async Task<IActionResult> OnPostActivateDeactivateAsync(int lessonId, bool isActive, int packageIds)
        {
            await _lessonRepository.ActivateDeactivateLessonAsync(lessonId, isActive);
            return RedirectToPage(new { packageId = packageIds });
        }
    }
}
