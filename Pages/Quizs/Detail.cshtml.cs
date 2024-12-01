using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

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

        public IActionResult OnGet(int questionId)
        {
            // Lấy câu hỏi theo questionId
            Question = _context.Questions
                                .Where(q => q.QuestionId == questionId)
                                .Include(q => q.Answers)  // Load các đáp án của câu hỏi
                                .FirstOrDefault();

            if (Question == null)
            {
                return NotFound();
            }

            return Page();
        }

        [BindProperty]
        public int SelectedAnswerId { get; set; }

        public IActionResult OnPost(int questionId)
        {
            // Xử lý câu trả lời
            var selectedAnswer = _context.Answers.FirstOrDefault(a => a.AnswerId == SelectedAnswerId);

            if (selectedAnswer != null)
            {
                // Có thể xử lý logic lưu lại câu trả lời vào database hoặc đánh dấu câu trả lời đúng sai tại đây
                // Ví dụ: 
                // _context.AnswerDetails.Add(new AnswerDetail { AnswerId = selectedAnswer.AnswerId, QuestionId = questionId, UserAnswer = true });
                // _context.SaveChanges();

                TempData["Result"] = "Cảm ơn bạn đã trả lời!";
                return RedirectToPage("Index");  // Redirect tới trang danh sách câu hỏi hoặc kết quả
            }

            // Nếu không chọn đáp án nào
            TempData["Result"] = "Bạn chưa chọn câu trả lời.";
            return RedirectToPage("/Quizs/Detail", new { questionId });
        }
    }
}
