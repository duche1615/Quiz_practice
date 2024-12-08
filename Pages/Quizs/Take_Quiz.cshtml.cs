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

        // Lấy câu hỏi ngẫu nhiên khi vào trang
        public void OnGet(int quizId, int subjectId)
        {
            // Tạo key session riêng biệt cho mỗi môn học
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

            // Deserialize danh sách câu hỏi từ session
            Questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString(sessionKey));

            // Thiết lập câu hỏi hiện tại (bước này có thể dùng để theo dõi câu hỏi hiện tại trong quiz)
            Question = Questions.FirstOrDefault();
        }

        // Xử lý trả lời câu hỏi và chuyển sang câu hỏi tiếp theo
        public IActionResult OnPostAnswer(int answerId)
        {
            // Lưu đáp án của người dùng vào session
            var currentQuestion = Questions[CurrentQuestionIndex];
            HttpContext.Session.SetInt32($"Answer_{currentQuestion.QuestionId}", answerId);

            // Cập nhật chỉ số câu hỏi để chuyển sang câu hỏi tiếp theo
            CurrentQuestionIndex++;
            HttpContext.Session.SetInt32("CurrentQuestionIndex", CurrentQuestionIndex);

            // Nếu đã hết câu hỏi thì chuyển hướng tới kết quả
            if (CurrentQuestionIndex >= Questions.Count)
            {
                TempData["Result"] = "Bạn đã hoàn thành bài kiểm tra!";
                return RedirectToPage("/Quizs/Result");
            }

            // Nếu còn câu hỏi, chuyển hướng tới trang Detail cho câu hỏi tiếp theo
            var nextQuestionId = Questions[CurrentQuestionIndex].QuestionId;
            return RedirectToPage("/Quizs/Detail", new { questionId = nextQuestionId });
        }
    }
}
