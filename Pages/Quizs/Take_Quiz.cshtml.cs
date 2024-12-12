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

            Questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString(sessionKey));

            // Kiểm tra nếu có questionId trong query string
            if (questionId.HasValue)
            {
                Question = Questions.FirstOrDefault(q => q.QuestionId == questionId.Value);
            }
            else
            {
                // Nếu không có questionId, lấy câu hỏi đầu tiên
                Question = Questions.FirstOrDefault();
            }

            // Khởi tạo CurrentQuestionIndex từ Session nếu chưa có
            CurrentQuestionIndex = HttpContext.Session.GetInt32("CurrentQuestionIndex") ?? 0;

            // Kiểm tra xem yêu cầu có phải AJAX không
            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                // Trả về Partial View chứa câu hỏi khi là yêu cầu AJAX
                return Partial("_QuestionPartial", Question);
            }

            // Nếu không phải yêu cầu AJAX, trả về toàn bộ trang
            return Page();
        }

        // Lưu đáp án người dùng và chuyển sang câu hỏi tiếp theo
        public async Task<IActionResult> OnPostAnswer(int subjectId, int quizId, int answerId, int questionId)
        {
            // Lưu đáp án đã chọn vào session
            var currentQuestion = Questions[CurrentQuestionIndex];
            HttpContext.Session.SetInt32($"Answer_{currentQuestion.QuestionId}", answerId);

            // Cập nhật chỉ số câu hỏi hiện tại trong session
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
            TempData["Result"] = "Answer saved successfully!";
            return RedirectToPage("Index", new { subjectId, quizId });
        }


        public IActionResult OnPostScoreExam(int subjectId, int quizId)
        {
            // Your logic to score the exam and calculate the result
            TempData["Result"] = "Exam submitted successfully!";

            // Redirect to the result page
            return RedirectToPage("Result", new { subjectId, quizId });
        }

    }
}

