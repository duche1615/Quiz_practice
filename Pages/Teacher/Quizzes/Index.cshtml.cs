using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Services.IRepository;
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
                Status = q.Status == true ? "Active" : "Inactive", 
                TotalQues = q.TotalQues,              
            }).ToList();
            
        }
    }
}
