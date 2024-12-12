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
        public Question Question { get; private set; }
        public int SubjectId { get; set; } // Lưu subjectId để truyền vào JavaScript
        public int QuizId { get; set; } // Lưu quizId để truyền vào JavaScript

        // Lấy câu hỏi từ session hoặc từ cơ sở dữ liệu
        public IActionResult OnGet(int subjectId, int quizId, int? questionId)
        {
            SubjectId = subjectId;
            QuizId = quizId;

            // Kiểm tra xem danh sách câu hỏi đã có trong session chưa
            string sessionKey = $"QuestionList_{subjectId}";
            if (HttpContext.Session.GetString(sessionKey) == null)
            {
                // Lấy câu hỏi ngẫu nhiên từ database
                var randomQuestions = _context.Questions
                                              .Where(q => q.SubjectId == subjectId)
                                              .OrderBy(q => Guid.NewGuid())
                                              .Take(10)
                                              .Include(q => q.Answers)
                                              .ToList();

                // Lưu danh sách câu hỏi vào session
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


        [HttpPost]
        public IActionResult OnPostSaveAnswer(int questionId, int selectedAnswerId)
        {
            // Lưu đáp án vào session
            HttpContext.Session.SetInt32($"Answer_{questionId}", selectedAnswerId);

            // Lấy câu hỏi tiếp theo
            var currentIndex = Questions.FindIndex(q => q.QuestionId == questionId);
            var nextQuestion = (currentIndex + 1 < Questions.Count)
                                ? Questions[currentIndex + 1]
                                : Questions[0]; // Quay lại câu đầu tiên nếu hết câu

            // Trả về câu hỏi tiếp theo dưới dạng Partial View
            return Partial("_QuestionPartial", nextQuestion);
        }
    }
}
