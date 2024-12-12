using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using Quizpractice.Models;
using System.Linq;

namespace Quizpractice.Pages.Quizs
{
    public class TakeQuizModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public TakeQuizModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public Question Question { get; set; }
        public int SelectedAnswerId { get; set; }

        // Phương thức GET để lấy câu hỏi
        public IActionResult OnGet(int subjectId, int quizId, int? questionId)
        {
            ViewData["SubjectId"] = subjectId;  // Truyền SubjectId vào ViewData
            ViewData["QuizId"] = quizId;        // Truyền QuizId vào ViewData

            string sessionKey = $"QuestionList_{subjectId}";

            if (HttpContext.Session.GetString(sessionKey) == null)
            {
                return NotFound("No questions found for this subject.");
            }

            var questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString(sessionKey));
            Question = questions.FirstOrDefault(q => q.QuestionId == questionId);
            SelectedAnswerId = HttpContext.Session.GetInt32($"Answer_{questionId}") ?? 0;

            ViewData["SelectedAnswerId"] = SelectedAnswerId;  // Truyền SelectedAnswerId vào ViewData

            if (Question == null)
            {
                return NotFound();
            }

            return Page();
        }


        // Phương thức POST để lưu câu trả lời và lấy câu hỏi tiếp theo
        [HttpPost]
        public IActionResult OnPostSaveAnswer(int questionId, int selectedAnswerId)
        {
            // Lưu đáp án vào session
            HttpContext.Session.SetInt32($"Answer_{questionId}", selectedAnswerId);

            return new JsonResult(new { success = true, message = "Answer saved successfully" });
        }
    }
}
