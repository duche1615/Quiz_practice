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
        [BindProperty(SupportsGet = true)]
        public int CurrentPage { get; set; } = 1; // Trang hiện tại
        public int TotalPages { get; set; } // Tổng số trang
        public int PageSize { get; set; } = 20; // Số câu hỏi trên mỗi trang
        public IEnumerable<QuestionAnswerViewModel> Questions { get; set; }
        
        public async Task OnGetAsync()
        {
            var questions = await _unitOfWork.Questions.GetAllQuestionsAsync();
            // Tính toán tổng số trang
            var totalQuestions = questions.Count();
            TotalPages = (int)Math.Ceiling(totalQuestions / (double)PageSize);

            Questions = questions
                .Skip((CurrentPage - 1) * PageSize) // Bỏ qua số câu hỏi trên trang trước
                .Take(PageSize) // Lấy số câu hỏi trên trang hiện tại
                .Select(q => new QuestionAnswerViewModel
            {
                Id = q.QuestionId,
                Content = q.Content,
                Level = q.Level,
                IsMultipleChoice = q.IsMultipleChoice ?? false,
                Status = q.Status == true ? "Active" : "Inactive",
                SubjectName = q.Subject?.SubjectName ?? "N/A",
                LessonName = q.Lesson?.LessonName ?? "N/A",
                TopicName = q.Topic?.Name ?? "N/A"
            }).ToList();
            
        }
    }
}
