using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Http;
using Quizpractice.Models;
using System.Collections.Generic;
using System.Linq;

namespace Quizpractice.Pages.Quizs
{
    public class ResultModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public ResultModel(SWP391_DBContext context)
        {
            _context = context;
        }

        // Các biến để lưu trữ điểm số và chi tiết câu trả lời
        public bool QuizFinished { get; set; }
        public int Score { get; set; }
        public List<AnswerDetail> AnswerDetails { get; set; }

        public IActionResult OnGet()
        {
            // Kiểm tra xem bài kiểm tra đã hoàn thành chưa
            var questionList = HttpContext.Session.GetString("QuestionList");
            if (string.IsNullOrEmpty(questionList))
            {
                // Nếu không có danh sách câu hỏi trong session, người dùng chưa bắt đầu bài kiểm tra
                return RedirectToPage("/Index");
            }

            // Deserialize câu hỏi và kiểm tra câu trả lời của người dùng
            var questions = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Question>>(questionList);
            AnswerDetails = new List<AnswerDetail>();
            Score = 0;

            foreach (var question in questions)
            {
                var selectedAnswerId = HttpContext.Session.GetInt32($"Answer_{question.QuestionId}");
                if (selectedAnswerId.HasValue)
                {
                    // Tìm đáp án được chọn
                    var selectedAnswer = question.Answers.FirstOrDefault(a => a.AnswerId == selectedAnswerId.Value);
                    bool isCorrect = selectedAnswer?.Correct ?? false;

                    // Tạo đối tượng AnswerDetail để lưu thông tin trả lời
                    AnswerDetails.Add(new AnswerDetail
                    {
                        QuestionId = question.QuestionId,
                        SelectedAnswer = selectedAnswer?.Content,
                        IsCorrect = isCorrect
                    });

                    // Tính điểm
                    if (isCorrect)
                    {
                        Score++;
                    }
                }
            }

            // Nếu không có câu trả lời nào được chọn, thông báo chưa hoàn thành
            QuizFinished = Score > 0;

            return Page();
        }
    }

    public class AnswerDetail
    {
        public int QuestionId { get; set; }
        public string SelectedAnswer { get; set; }
        public bool IsCorrect { get; set; }
    }
}
