using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace Quizpractice.Pages.Quizs
{
    public class IndexModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public IndexModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public Quiz Quiz { get; set; }
        public List<Question> Questions { get; set; }
        public int CurrentQuestionIndex { get; set; }
        public Question Question { get; private set; }
        public int SelectedAnswerId { get; set; }

        public int SubjectId { get; set; } // Lưu subjectId để truyền vào JavaScript
        public int QuizId { get; set; } // Lưu quizId để truyền vào JavaScript

        public IActionResult OnGet(int subjectId, int quizId, int? questionId)
        {
            SubjectId = subjectId;
            QuizId = quizId;

            // Lấy câu hỏi theo quizId và subjectId từ session hoặc cơ sở dữ liệu
            string sessionKey = $"QuestionList_{subjectId}";

            // Kiểm tra session, nếu chưa có câu hỏi thì lấy từ cơ sở dữ liệu
            if (HttpContext.Session.GetString(sessionKey) == null)
            {
                var randomQuestions = _context.Questions
                                              .Where(q => q.SubjectId == subjectId)
                                              .OrderBy(q => Guid.NewGuid()) // Sắp xếp ngẫu nhiên
                                              .Take(20)
                                              .Include(q => q.Answers)
                                              .ToList();

                var settings = new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                };

                HttpContext.Session.SetString(sessionKey, JsonConvert.SerializeObject(randomQuestions, settings));
            }

            // Deserialize câu hỏi từ session
            Questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString(sessionKey));

            // Nếu có questionId, lấy câu hỏi theo ID
            if (questionId.HasValue)
            {
                Question = Questions.FirstOrDefault(q => q.QuestionId == questionId.Value);
            }
            else
            {
                // Nếu không có questionId, lấy câu hỏi đầu tiên
                Question = Questions.FirstOrDefault();
            }

            // Kiểm tra xem yêu cầu có phải AJAX không
            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                // Trả về Partial View chứa câu hỏi khi là yêu cầu AJAX
                return Partial("_QuestionPartial", Question);
            }

            // Nếu không phải yêu cầu AJAX, trả về toàn bộ trang
            return Page();
        }





        public IActionResult OnPostAnswer(int answerId)
        {
            // Lưu đáp án đã chọn vào session
            var currentQuestion = Questions[CurrentQuestionIndex];
            HttpContext.Session.SetInt32($"Answer_{currentQuestion.QuestionId}", answerId);

            // Chuyển sang câu hỏi tiếp theo
            CurrentQuestionIndex++;
            HttpContext.Session.SetInt32("CurrentQuestionIndex", CurrentQuestionIndex);

            // Kiểm tra nếu hết câu hỏi, có thể hiển thị kết quả
            if (CurrentQuestionIndex >= Questions.Count)
            {
                TempData["Result"] = "You have finished the quiz!";
                return RedirectToPage("Result"); // Điều hướng đến trang kết quả
            }

            // Cập nhật câu hỏi hiện tại
            Question = Questions[CurrentQuestionIndex];
            return Page();  // Quay lại trang hiện tại
        }
    }
}
