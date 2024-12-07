using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.Services.Repository;
using Quizpractice.ViewModels;
using System.Linq;

namespace Quizpractice.Pages.Teacher.Quizzes
{
    public class CreateModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public CreateModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public CreateQuizViewModel Quiz { get; set; }
        public IEnumerable<Chapter> Chapters { get; set; }
        public IEnumerable<Subject> Subjects { get; set; }
        public async Task OnGetAsync()
        {
            Subjects = await _unitOfWork.Subjects.GetAllSubjects();
            Chapters = await _unitOfWork.Chapters.GetAllChapters();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (Quiz.SubjectId == null)
            {
                ModelState.AddModelError("", "Subject is required.");
                Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }
            // get all questions by subject id
            var questions = await _unitOfWork.Questions.GetQuestionsBySubjectIdAsync(Quiz.SubjectId.Value);
            //check if chapter id is selected
            if (Quiz.ChapterId.HasValue)
            {
                questions = questions.Where(q => q.ChapterId == Quiz.ChapterId.Value).ToList();
            }
            // check if start time is greater than end time
            if (Quiz.EndTime <= Quiz.StartTime)
            {
                ModelState.AddModelError("", "End time must be greater than start time.");
                Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }
            // check if total questions is greater than the number of questions
            if (questions.Count() < Quiz.TotalQuestions)
            {
                ModelState.AddModelError("", "Not enough questions for quiz.");
                Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }                 
            var totalQuestions = Quiz.TotalQuestions;

            // check if total questions is greater than 0
            if (totalQuestions > 0)
            {
                // chose random questions
                var random = new Random();
                var selectedQuestions = questions.OrderBy(q => random.Next()).Take(totalQuestions).ToList();

                
                var quiz = new Quiz
                {
                    Title = Quiz.Title,
                    Level = Quiz.Level,
                    Description = Quiz.Description,
                    Duration = Quiz.Duration,
                    SubId = Quiz.SubjectId,
                    TotalQues = totalQuestions,
                    StartTime = Quiz.StartTime, 
                    EndTime = Quiz.EndTime,
                    Active = true 
                };

                
                await _unitOfWork.Quizzes.AddAsync(quiz);

                // add questions to quiz
                foreach (var question in selectedQuestions)
                {
                    var quizQuestion = new QuestionQuiz
                    {
                        QuizId = quiz.QuizId,
                        QuesId = question.QuestionId
                    };
                    await _unitOfWork.Quizzes.AddQuestionToQuizAsync(quizQuestion); 
                }

                return RedirectToPage("./Index");
            }
            else
            {
                ModelState.AddModelError("", "totalques must greater than 0.");
                return Page();
            }
        }
    }
}
