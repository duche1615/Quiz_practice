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

        public IActionResult OnGet(int questionId)
        {
            // Lấy danh sách câu hỏi ngẫu nhiên từ session nếu chưa có
            var questionList = HttpContext.Session.GetString("QuestionList");

            if (string.IsNullOrEmpty(questionList))
            {
                // Nếu chưa có danh sách câu hỏi trong session, tạo mới danh sách ngẫu nhiên
                var randomQuestions = _context.Questions.OrderBy(q => Guid.NewGuid()).Take(20).ToList();
                HttpContext.Session.SetString("QuestionList", JsonConvert.SerializeObject(randomQuestions));
            }

            // Deserialize danh sách câu hỏi từ JSON trong session
            var questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString("QuestionList"));

            // Tìm câu hỏi hiện tại trong danh sách
            var currentQuestion = questions.FirstOrDefault(q => q.QuestionId == questionId);

            if (currentQuestion == null)
            {
                return NotFound();
            }

            // Lấy câu hỏi và đáp án từ cơ sở dữ liệu
            Question = _context.Questions
                .Include(q => q.Answers)
                .FirstOrDefault(q => q.QuestionId == questionId);

            // Lấy đáp án đã chọn (nếu có) từ session
            SelectedAnswerId = HttpContext.Session.GetInt32($"Answer_{questionId}") ?? 0;

            return Page();
        }

        public IActionResult OnPost(int questionId)
        {
            // Lưu câu trả lời vào session
            HttpContext.Session.SetInt32($"Answer_{questionId}", SelectedAnswerId);

            // Xử lý tiếp theo sau khi người dùng trả lời, ví dụ: chuyển đến câu hỏi tiếp theo
            var questionList = HttpContext.Session.GetString("QuestionList");
            var questions = JsonConvert.DeserializeObject<List<Question>>(questionList);

            var currentIndex = questions.FindIndex(q => q.QuestionId == questionId);

            if (currentIndex == -1 || currentIndex >= questions.Count - 1)
            {
                TempData["Result"] = "Bạn đã hoàn thành bài kiểm tra!";
                return RedirectToPage("/Quizs/Result");  // Redirect đến trang kết quả
            }

            // Lấy câu hỏi tiếp theo
            var nextQuestion = questions[currentIndex + 1];

            return RedirectToPage("/Quizs/Detail", new { questionId = nextQuestion.QuestionId });
        }
    }
}
