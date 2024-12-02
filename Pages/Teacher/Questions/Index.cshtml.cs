using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.Services.Repository;
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
        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; } = string.Empty;      

        public IEnumerable<QuestionAnswerViewModel> Questions { get; set; }
        
        public async Task OnGetAsync()
        {
            
            IEnumerable<Question> questions;
            if (!string.IsNullOrWhiteSpace(SearchTerm))
            {
                questions = await _unitOfWork.Questions.SearchQuestionsByContentAsync(SearchTerm);
            }
            else
            {
                questions = await _unitOfWork.Questions.GetAllQuestionsAsync();
            }
            
            // Tính toán tổng số trang
            

            Questions = questions
                
                .Select(q => new QuestionAnswerViewModel
            {
                Id = q.QuestionId,
                Content = q.Content,
                Level = q.Level,
                IsMultipleChoice = q.IsMultipleChoice ?? false,
                Status = q.Status == true ? "Active" : "Inactive",
                SubjectName = q.Subject?.SubjectName ?? "N/A",              
                ChapterName = q.Chapter?.ChapterName ?? "N/A"
            }).ToList();
            
        }

        public async Task<IActionResult> OnPostChangeStatusAsync(int questionId)
        {
            // Fetch the question and toggle its status
            var question = await _unitOfWork.Questions.GetQuestionWithAnswersAsync(questionId);
            if (question != null)
            {
                question.Status = question.Status ?? false; 
                question.Status = !question.Status; 

                await _unitOfWork.SaveAsync();
            }

            return RedirectToPage(); 
        }

    }
}
