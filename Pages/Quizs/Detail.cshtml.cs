using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Linq;

namespace Quizpractice.Pages.Quizs
{
    public class DetailModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public DetailModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public Question Question { get; set; }
        
        [BindProperty]
        public int SelectedAnswerId { get; set; }

        public IActionResult OnGet(int questionId, int subjectId)
        {
            string sessionKey = $"QuestionList_{subjectId}";

            // Kiểm tra xem câu hỏi đã được lưu trong session chưa, nếu chưa thì tạo mới
            if (HttpContext.Session.GetString(sessionKey) == null)
            {
                // Lọc câu hỏi theo SubjectId (môn học) từ cơ sở dữ liệu
                var randomQuestions = _context.Questions
                                              .Where(q => q.SubjectId == subjectId)  // Lọc câu hỏi theo môn học
                                              .OrderBy(q => Guid.NewGuid())          // Xáo trộn câu hỏi ngẫu nhiên
                                              .Take(20)                              // Lấy 20 câu hỏi ngẫu nhiên
                                              .ToList();

                // Lưu danh sách câu hỏi vào session với key phụ thuộc vào SubjectId
                HttpContext.Session.SetString(sessionKey, JsonConvert.SerializeObject(randomQuestions));
            }

            // Deserialize danh sách câu hỏi từ JSON trong session
            var questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString(sessionKey));
            Console.WriteLine(string.Join(", ", questions.Select(q => q.QuestionId.ToString())));

            // Tìm câu hỏi hiện tại trong danh sách
            var currentQuestion = questions.FirstOrDefault(q => q.QuestionId == questionId);

            if (currentQuestion == null)
            {
                return NotFound();
            }


            Question = _context.Questions
                               .Include(q => q.Answers)  
                               .FirstOrDefault(q => q.QuestionId == currentQuestion.QuestionId);

            // Lấy đáp án đã chọn (nếu có) từ session
            SelectedAnswerId = HttpContext.Session.GetInt32($"Answer_{questionId}") ?? 0;

            return Page();
        }

        public IActionResult OnPost(int questionId, int subjectId)
        {
            // Lấy danh sách câu hỏi từ session
            string sessionKey = $"QuestionList_{subjectId}";
            var questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString(sessionKey));

            if (questions == null || !questions.Any())
            {
                // Nếu không có câu hỏi trong session, chuyển hướng về trang câu hỏi đầu tiên
                return RedirectToPage("/Quizs/Detail", new { questionId = questions?.FirstOrDefault()?.QuestionId ?? 0, subjectId });
            }

            // Kiểm tra nếu người dùng có chọn đáp án không
            if (SelectedAnswerId != 0)
            {
                // Lưu câu trả lời đã chọn vào session nếu có lựa chọn
                HttpContext.Session.SetInt32($"Answer_{questionId}", SelectedAnswerId);
            }

            // Tìm câu hỏi tiếp theo trong danh sách
            var currentQuestionIndex = questions.FindIndex(q => q.QuestionId == questionId);
            if (currentQuestionIndex >= 0 && currentQuestionIndex < questions.Count - 1)
            {
                // Chuyển đến câu hỏi tiếp theo
                var nextQuestionId = questions[currentQuestionIndex + 1].QuestionId;
                return RedirectToPage("/Quizs/Detail", new { questionId = nextQuestionId, subjectId });
            }
            else
            {
                // Nếu không có câu hỏi tiếp theo, có thể hoàn thành bài quiz hoặc làm gì đó khác
                return RedirectToPage("/Quizs/Completion"); // Chuyển hướng đến trang hoàn thành quiz
            }
        }
    }
}
