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
        public int CurrentQuestionIndex { get; private set; }
        public int Duration { get; set; } // Duration in seconds

        // Lấy câu hỏi từ session hoặc từ cơ sở dữ liệu
        public IActionResult OnGet(int subjectId, int quizId, int? questionId)
        {
            SubjectId = subjectId;
            QuizId = quizId;

            var quiz = _context.Quizzes.FirstOrDefault(q => q.QuizId == quizId);
            if (quiz != null)
            {
                Duration = (int)quiz.Duration * 60; // Duration in seconds
            }


            string sessionKey = $"QuestionList_{subjectId}";
            if (HttpContext.Session.GetString(sessionKey) == null)
            {
                List<Question> qs = new List<Question>();
                // Lấy câu hỏi từ database
                //var randomQuestions = _context.Questions
                //                              .Where(q => q.SubjectId == subjectId)
                //                              .OrderBy(q => Guid.NewGuid())
                //                              .Take(10)
                //                              .Include(q => q.Answers)
                //                              .ToList();
                var listquestion = _context.QuestionQuizzes.Where(qq => qq.QuizId == quizId).ToList();
                foreach (var question in listquestion)
                {
                    qs.Add(_context.Questions.Include(q => q.Answers).First(q => q.QuestionId == question.QuesId));
                }
                // Lưu danh sách câu hỏi vào session
                var settings = new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                };
                //HttpContext.Session.SetString(sessionKey, JsonConvert.SerializeObject(randomQuestions, settings));
                HttpContext.Session.SetString(sessionKey, JsonConvert.SerializeObject(qs, settings));
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

            // Lấy câu hỏi tiếp theo
            var currentIndex = Questions.FindIndex(q => q.QuestionId == questionId);
            var nextQuestion = (currentIndex + 1 < Questions.Count)
                                ? Questions[currentIndex + 1]
                                : Questions[0]; // Quay lại câu đầu tiên nếu hết câu

            // Cập nhật câu hỏi hiện tại
            Question = Questions[CurrentQuestionIndex];
            TempData["Result"] = "Answer saved successfully!";
            return RedirectToPage("Result", new { subjectId, quizId });
        }


        public IActionResult OnPostScoreExam(int subjectId, int quizId)
        {
            // Retrieve the question list from session
            string sessionKey = $"QuestionList_{subjectId}";
            var questionList = HttpContext.Session.GetString(sessionKey);
            if (string.IsNullOrEmpty(questionList))
            {
                TempData["Error"] = "No questions available to score.";
                return RedirectToPage("./List");
            }

            var questions = JsonConvert.DeserializeObject<List<Question>>(questionList);
            int correctAnswers = 0;

            // Calculate the score
            foreach (var question in questions)
            {
                var selectedAnswerId = HttpContext.Session.GetInt32($"Answer_{question.QuestionId}");
                if (selectedAnswerId.HasValue)
                {
                    var selectedAnswer = question.Answers.FirstOrDefault(a => a.AnswerId == selectedAnswerId.Value);
                    if (selectedAnswer?.Correct == true)
                    {
                        correctAnswers++;
                    }
                }
            }

            // Save the result in QuizDetail table
            var userIdString = HttpContext.Session.GetString("UserId");
            if (string.IsNullOrEmpty(userIdString))
            {
                TempData["Error"] = "User is not logged in.";
                return RedirectToPage("/Users/Login");
            }

            int userId = int.Parse(userIdString);
            var score = correctAnswers;
            var quizDetail = new QuizDetail
            {
                QuizId = quizId,
                UserId = userId,
                TakenDate = DateTime.Now,
                Score = score
            };

            _context.QuizDetails.Add(quizDetail);
            _context.SaveChanges();

            // Redirect to result page
            TempData["Score"] = $"{score}/{questions.Count}";
            return RedirectToPage("Result", new { subjectId, quizId });
        }


    }
}