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
        public bool QuizFinished { get; set; }
        public int Score { get; set; }
        public List<AnswerDetail> AnswerDetails { get; set; }

        public IActionResult OnGet(int subjectId, int quizId)
        {
            string sessionKey = $"QuestionList_{subjectId}";
            var questionList = HttpContext.Session.GetString(sessionKey);

            if (string.IsNullOrEmpty(questionList))
            {
                return RedirectToPage("./List");
            }

            var questions = JsonConvert.DeserializeObject<List<Question>>(questionList);
            int correctAnswers = 0;
            List<AnswerDetail> answerDetails = new List<AnswerDetail>();

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

                answerDetails.Add(new AnswerDetail
                {
                    QuestionId = question.QuestionId,
                    QuestionContent = question.Content,
                    SelectedAnswer = selectedAnswerContent,
                    IsCorrect = isCorrect,
                    CorrectAnswer = question.Answers.FirstOrDefault(a => a.Correct == true)?.Content ?? "N/A"
                });
            }

            double totalQuestions = questions.Count;
            double score = totalQuestions > 0 ? (correctAnswers / totalQuestions) * 10 : 0;

            // Pass data to the view
            ViewData["Score"] = score.ToString("F1");
            ViewData["CorrectAnswers"] = correctAnswers;
            ViewData["SubjectId"] = subjectId;
            ViewData["QuizId"] = quizId;
            ViewData["AnswerDetails"] = answerDetails;

            return Page();
        }

        public IActionResult OnGetClearAnswers(int subjectId, int quizId)
        {
            // Retrieve the question list from the session
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
