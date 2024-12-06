using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Questions
{
    public class CreateModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
  

        public CreateModel(IUnitOfWork unitOfWork, ISubjectRepository subjectRepository)
        {
            _unitOfWork = unitOfWork;
            
        }

        [BindProperty]
        public QuestionAnswerViewModel QuestionAnswer { get; set; }

        public async Task OnGet()
        {

            QuestionAnswer =  new QuestionAnswerViewModel();

            // Tạo câu trả lời mặc định
            QuestionAnswer.Answers = new List<AnswerViewModel>
            {
                new AnswerViewModel(),
                new AnswerViewModel(),
                new AnswerViewModel(),
                new AnswerViewModel()
            };
            QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
            QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            QuestionAnswer = new QuestionAnswerViewModel();
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError(string.Empty, "Error");
                QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page(); 
            }
            if (QuestionAnswer.SubjectId == null || QuestionAnswer.SubjectId <= 0|| QuestionAnswer.ChapterId == null || QuestionAnswer.ChapterId <= 0)
            {
                ModelState.AddModelError(string.Empty, "Please select a subject and chapter for the question.");
                QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }
            if (!QuestionAnswer.IsMultipleChoice)
            {
                var correctAnswers = QuestionAnswer.Answers.Count(a => a.Correct);
                if (correctAnswers != 1)
                {
                    ModelState.AddModelError(string.Empty, "Please choose one correct answer.");
                    QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                    QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
                    return Page();
                }
            }
            else
            {
                var correctAnswers = QuestionAnswer.Answers.Count(a => a.Correct);
                if (correctAnswers < 2)
                {
                    ModelState.AddModelError(string.Empty, "Please choose at least two correct answers.");
                    QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                    QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
                    return Page(); 
                }
            }
            // create question
            var question = new Question
            {
                Content = QuestionAnswer.Content,
                Status =true,
                Level = QuestionAnswer.Level,
                SubjectId = QuestionAnswer.SubjectId.Value,
                ChapterId = QuestionAnswer.ChapterId.Value,
                IsMultipleChoice = QuestionAnswer.IsMultipleChoice
            };

            
            await _unitOfWork.Questions.AddQuestionAsync(question);

            // add answer
            foreach (var answerViewModel in QuestionAnswer.Answers)
            {
                var answer = new Answer
                {
                    Content = answerViewModel.Content,
                    Correct = answerViewModel.Correct,
                    QuesId = question.QuestionId   
                };

                
                await _unitOfWork.Answers.AddAnswerAsync(answer);
            }

            
            await _unitOfWork.SaveAsync();

            QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
            QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
            return RedirectToPage("Index");
        }
    }
}
