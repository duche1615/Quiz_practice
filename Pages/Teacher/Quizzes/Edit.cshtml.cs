using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Teacher.Quizzes
{
    public class EditModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public EditModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public EditQuizViewModel QuizVM { get; set; } = new();


        public async Task<IActionResult> OnGetAsync(int id)
        {
            // Load quiz to edit
            var quiz = await _unitOfWork.Quizzes.GetByIdAsync(id);
            if (quiz == null)
            {
                return NotFound();
            }

            // Map data to the view model
            QuizVM = new EditQuizViewModel
            {
                QuizId = quiz.QuizId,
                Title = quiz.Title,
                Level = quiz.Level,
                Description = quiz.Description,
                Duration = quiz.Duration,
                StartTime = quiz.StartTime,
                EndTime = quiz.EndTime,
            };


            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (QuizVM.EndTime <= QuizVM.StartTime)
            {
                ModelState.AddModelError(string.Empty, "End Time must be after Start Time.");
            }          

            // Update quiz entity
            var quiz = await _unitOfWork.Quizzes.GetByIdAsync(QuizVM.QuizId);
            if (quiz == null)
            {
                return NotFound();
            }

            // Map data from ViewModel to Quiz entity
            quiz.Title = QuizVM.Title;
            quiz.Level = QuizVM.Level;
            quiz.Description = QuizVM.Description;
            quiz.Duration = QuizVM.Duration;
            quiz.StartTime = QuizVM.StartTime;
            quiz.EndTime = QuizVM.EndTime;


            // Save changes
            
            await _unitOfWork.SaveAsync();

            return RedirectToPage("Index");
        }
    }
}
