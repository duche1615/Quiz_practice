//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.RazorPages;
//using Microsoft.EntityFrameworkCore;
//using Quizpractice.Models;
//using System.Linq;

//namespace Quizpractice.Pages.Quizs
//{
//    public class IndexModel : PageModel
//    {
//        private readonly SWP391_DBContext _context;

//        public IndexModel(SWP391_DBContext context)
//        {
//            _context = context;
//        }

//        public Quiz Quiz { get; set; }
//        public List<Question> Questions { get; set; }

//        public void OnGet(int quizId)
//        {
            
//            Questions = _context.Questions
//                                .OrderBy(q => Guid.NewGuid())  
//                                .Take(20)                     
//                                .ToList();
//        }



//        public IActionResult OnPost(int questionId, int answerId)
//        {
//            var question = _context.Questions
//                .Include(q => q.Answers)  // Bao gồm các đáp án cho câu hỏi
//                .FirstOrDefault(q => q.QuestionId == questionId);

//            if (question != null)
//            {
//                // Lấy đáp án đúng từ cơ sở dữ liệu
//                var correctAnswer = question.Answers.FirstOrDefault(a => a.Correct == true)?.AnswerId;

//                // Lưu kết quả vào bảng AnswerDetails
//                var answerDetail = new AnswerDetail
//                {
//                    QuestionId = questionId,
//                    AnswerId = answerId,
//                    UserId = 1,  // Ví dụ: Giả sử UserId là 1 (thay bằng ID thực tế của người dùng)
//                    QuizId = question.QuizId,
//                    Attempt = 1  // Giả sử người dùng thử trả lời lần đầu tiên
//                };

//                _context.AnswerDetails.Add(answerDetail);
//                _context.SaveChanges();

//                // Hiển thị kết quả trả lời
//                if (answerId == correctAnswer)
//                {
//                    TempData["Result"] = "Correct Answer!";
//                }
//                else
//                {
//                    TempData["Result"] = "Incorrect Answer.";
//                }
//            }

//            return RedirectToPage();
//        }
//    }
//}
