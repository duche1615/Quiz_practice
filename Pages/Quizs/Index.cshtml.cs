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
        public void OnGet(int quizId)
        {
            // Kiểm tra xem câu hỏi đã được lưu trong session chưa, nếu chưa thì tạo mới
            if (HttpContext.Session.GetString("QuestionList") == null)
            {
                var randomQuestions = _context.Questions
                    .OrderBy(q => Guid.NewGuid())
                    .Take(20)
                    .ToList();

                // Lưu danh sách câu hỏi vào session
                HttpContext.Session.SetString("QuestionList", JsonConvert.SerializeObject(randomQuestions));
            }

            // Đọc câu hỏi ngẫu nhiên từ session
            Questions = JsonConvert.DeserializeObject<List<Question>>(HttpContext.Session.GetString("QuestionList"));

          
            CurrentQuestionIndex = HttpContext.Session.GetInt32("CurrentQuestionIndex") ?? 0;

            
            if (CurrentQuestionIndex < Questions.Count)
            {
                Question = Questions[CurrentQuestionIndex];
            }
            else
            {
               
                TempData["Result"] = "Bạn đã hoàn thành bài kiểm tra!";
                Response.Redirect("/Quizs/Result");
            }
        }

        // Xử lý trả lời câu hỏi và chuyển sang câu hỏi tiếp theo
        public IActionResult OnPostAnswer(int answerId)
        {
            // Lưu đáp án người dùng vào session
            // (Có thể lưu vào database nếu cần thiết)
            HttpContext.Session.SetInt32($"Answer_{Questions[CurrentQuestionIndex].QuestionId}", answerId);

            // Cập nhật chỉ số câu hỏi hiện tại trong session
            CurrentQuestionIndex++;
            HttpContext.Session.SetInt32("CurrentQuestionIndex", CurrentQuestionIndex);

            // Kiểm tra nếu đã trả lời hết tất cả các câu hỏi
            if (CurrentQuestionIndex < Questions.Count)
            {
                // Chuyển hướng đến câu hỏi tiếp theo
                return RedirectToPage("/Quizs/Index", new { quizId = 1 }); // Thay 1 bằng quizId thực tế nếu có
            }
            else
            {
                // Nếu đã hoàn thành, chuyển đến trang kết quả
                TempData["Result"] = "Bạn đã hoàn thành bài kiểm tra!";
                return RedirectToPage("/Quizs/Result");
            }
        }
    }
}
