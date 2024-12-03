using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Services.IRepository;
using Quizpractice.Services.Repository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Teacher.Quizzes
{
    public class IndexModel : PageModel
    {
        private readonly IQuizRepository _quizRepository;

        
        public IndexModel(IQuizRepository quizRepository)
        {
            _quizRepository = quizRepository;
        }

        public IEnumerable<QuizViewModel> Quizzes { get; set; }
        public async Task OnGetAsync()
        {
            
            var quizzes = await _quizRepository.GetAllAsync();
            
            
            Quizzes = quizzes.Select(q => new QuizViewModel
            {
                QuizId = q.QuizId,
                Title = q.Title,
                Level = q.Level,
                Description = q.Description,
                Duration = (int)q.Duration,
                Status = q.Active == true ? "Active" : "Inactive", 
                TotalQues = q.TotalQues,              
            }).ToList();
            
        }

        public async Task<IActionResult> OnPostChangeQuizStatusAsync(int quizId)
        {
            var quiz = await _quizRepository.GetQuizByIdAsync(quizId);

            if (quiz != null)
            {
                
                quiz.Active = quiz.Active ?? false;

                
                quiz.Active = !quiz.Active;

                await _quizRepository.UpdateQuizStatusAsync(quizId,quiz.Active.Value); 
            }

            return RedirectToPage(); 
        }
    }
}
