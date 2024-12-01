using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Questions
{
    public class IndexModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        

        public IndexModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        
        }

        public IEnumerable<QuestionAnswerViewModel> Questions { get; set; }
        
        public async Task OnGetAsync()
        {
            var questions = await _unitOfWork.Questions.GetQuestionsWithDetailsAsync();
          
            Questions = questions.Select(q => new QuestionAnswerViewModel
            {
                Id = q.QuestionId,
                Content = q.Content,
                Level = q.Level,
                IsMultipleChoice = q.IsMultipleChoice ?? false,
                SubjectName = q.Subject?.SubjectName ?? "N/A",
                LessonName = q.Lesson?.LessonName ?? "N/A",
                TopicName = q.Topic?.Name ?? "N/A"
            }).ToList();

        }
    }
}
