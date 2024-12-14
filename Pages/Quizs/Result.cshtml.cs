using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Quizpractice.Models;


using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Http;
using Quizpractice.Models;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

namespace Quizpractice.Pages.Quizs
{
    public class ResultModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public ResultModel(SWP391_DBContext context)
        {
            _context = context;
            AnswerDetails = new List<AnswerDetail>();
        }

        // Variables to store quiz results
        public int Score { get; set; }
        public List<AnswerDetail> AnswerDetails { get; set; }

        public IActionResult OnGet(int subjectId, int quizId)
        {
            string sessionKey = $"QuestionList_{subjectId}";
            var questionList = HttpContext.Session.GetString(sessionKey);

            if (string.IsNullOrEmpty(questionList))
            {
                TempData["Error"] = "Không tìm thấy danh sách câu hỏi trong session.";
                return RedirectToPage("./List"); // Redirect về trang danh sách quiz
            }

            var questions = JsonConvert.DeserializeObject<List<Question>>(questionList);
            int correctAnswers = 0;
            AnswerDetails = new List<AnswerDetail>();

            foreach (var question in questions)
            {
                var selectedAnswerId = HttpContext.Session.GetInt32($"Answer_{question.QuestionId}");
                string selectedAnswerContent = "No Answer";
                bool isCorrect = false;

                if (selectedAnswerId.HasValue)
                {
                    var selectedAnswer = question.Answers.FirstOrDefault(a => a.AnswerId == selectedAnswerId.Value);
                    selectedAnswerContent = selectedAnswer?.Content ?? "No Answer";
                    isCorrect = selectedAnswer?.Correct ?? false;

                    if (isCorrect)
                    {
                        correctAnswers++;
                    }
                }

                AnswerDetails.Add(new AnswerDetail
                {
                    QuestionId = question.QuestionId,
                    QuestionContent = question.Content,
                    SelectedAnswer = selectedAnswerContent,
                    IsCorrect = isCorrect,
                    CorrectAnswer = question.Answers.FirstOrDefault(a => a.Correct == true)?.Content ?? "N/A"
                });
            }

            double totalQuestions = questions.Count;
            Score = totalQuestions > 0 ? (int)((correctAnswers / totalQuestions) * 10) : 0;

            // Pass data to the view using ViewData
            ViewData["Score"] = Score;
            ViewData["CorrectAnswers"] = correctAnswers;
            ViewData["TotalQuestions"] = questions.Count;
            ViewData["AnswerDetails"] = AnswerDetails;

            // Xóa session sau khi tính toán
            ClearSession(subjectId, questions);

            return Page();
        }

        private void ClearSession(int subjectId, List<Question> questions)
        {
            // Xóa danh sách câu hỏi khỏi session
            string sessionKey = $"QuestionList_{subjectId}";
            HttpContext.Session.Remove(sessionKey);

            // Xóa câu trả lời đã lưu trong session
            foreach (var question in questions)
            {
                HttpContext.Session.Remove($"Answer_{question.QuestionId}");
            }
        }

        public IActionResult OnGetClearAnswers(int subjectId, int quizId)
        {
            // Xóa session liên quan đến câu trả lời
            string sessionKey = $"QuestionList_{subjectId}";
            var questionList = HttpContext.Session.GetString(sessionKey);

            if (!string.IsNullOrEmpty(questionList))
            {
                var questions = JsonConvert.DeserializeObject<List<Question>>(questionList);

                // Clear only the answer-related session keys
                foreach (var question in questions)
                {
                    HttpContext.Session.Remove($"Answer_{question.QuestionId}");
                }
            }

            // Redirect to the quiz start page
            return RedirectToPage("/Quizs/Take_Quiz", new { subjectId, quizId });
        }

        public class AnswerDetail
        {
            public int QuestionId { get; set; }
            public string QuestionContent { get; set; }
            public string SelectedAnswer { get; set; }
            public string CorrectAnswer { get; set; }
            public bool IsCorrect { get; set; }
        }
    }
}