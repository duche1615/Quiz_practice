using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;

namespace Quizpractice.Pages.Quizs
{
    public class _QuestionPartialModel : PageModel
    {
        private readonly SWP391_DBContext _dbContext;

        public _QuestionPartialModel(SWP391_DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        [BindProperty(SupportsGet = true)]
        public int QuestionId { get; set; } // ID câu hỏi hiện tại

        public Question? Question { get; set; } // Dữ liệu câu hỏi
        public int? SelectedAnswer { get; set; } // Đáp án đã chọn

        public void OnGet()
        {
            // Lấy câu hỏi từ cơ sở dữ liệu cùng với đáp án của nó
            Question = _dbContext.Questions
                .Where(q => q.QuestionId == QuestionId)
                .Select(q => new Question
                {
                    QuestionId = q.QuestionId,
                    Content = q.Content,
                    Level = q.Level,
                    IsMultipleChoice = q.IsMultipleChoice,
                    Answers = q.Answers.Select(a => new Answer
                    {
                        AnswerId = a.AnswerId,
                        Content = a.Content,
                        Correct = a.Correct
                    }).ToList()
                })
                .FirstOrDefault();

            // Lấy đáp án đã chọn từ Session
            if (Question != null)
            {
                SelectedAnswer = HttpContext.Session.GetInt32($"Answer_{QuestionId}");
            }

            // Cập nhật ViewData để có thể hiển thị trên trang
            ViewData["SelectedAnswer"] = SelectedAnswer;
        }


        public IActionResult OnPostSaveAnswer(int questionId, int selectedAnswer)
        {
            // Lưu đáp án đã chọn vào Session
            try
            {
                HttpContext.Session.SetInt32($"Answer_{questionId}", selectedAnswer);
                return new JsonResult(new { success = true });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, error = ex.Message });
            }

        }

    }
}
