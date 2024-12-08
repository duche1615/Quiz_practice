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
        public CreateQuizViewModel QuizModel { get; set; }
        public IEnumerable<Chapter> Chapters { get; set; }
        public IEnumerable<Subject> Subjects { get; set; }
        public async Task OnGetAsync()
        {
            Subjects = await _unitOfWork.Subjects.GetAllSubjects();
            Chapters = await _unitOfWork.Chapters.GetAllChapters();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (QuizModel.SubjectId == null)
            {
                ModelState.AddModelError("", "Subject is required.");
                Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }
            // get all questions by subject id
            var questions = await _unitOfWork.Questions.GetQuestionsBySubjectIdAsync(QuizModel.SubjectId.Value);
            //check if chapter id is selected
            if (QuizModel.ChapterId.HasValue)
            {
                questions = questions.Where(q => q.ChapterId == QuizModel.ChapterId.Value).ToList();
            }
            // check if start time is greater than end time
            if (QuizModel.EndTime <= QuizModel.StartTime)
            {
                ModelState.AddModelError("", "End time must be greater than start time.");
                Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }
            // check if total questions is greater than the number of questions
            if (questions.Count() < QuizModel.TotalQuestions)
            {
                ModelState.AddModelError("", "Not enough questions for quiz.");
                Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }                 
            var totalQuestions = QuizModel.TotalQuestions;

            // check if total questions is greater than 0
            if (totalQuestions > 0)
            {
                // chose random questions
                var random = new Random();
                var selectedQuestions = questions.OrderBy(q => random.Next()).Take(totalQuestions).ToList();

                var userId = HttpContext.Session.GetString("UserId");
                
                if (userId == null)
                {
                    ModelState.AddModelError("", "User is not logged in.");
                    return Page();
                }

                var quiz = new Quiz
                {
                    Title = QuizModel.Title,
                    Level = QuizModel.Level,
                    Description = QuizModel.Description,
                    Duration = QuizModel.Duration,
                    SubId = QuizModel.SubjectId,
                    TotalQues = totalQuestions,
                    StartTime = QuizModel.StartTime, 
                    EndTime = QuizModel.EndTime,
                    Active = true,
                    UserCreateId = Convert.ToInt32(userId)
                };

                //add quiz
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
