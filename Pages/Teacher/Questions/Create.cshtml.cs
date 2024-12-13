using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Questions
{
    [Authorize(Roles = "Lecturer")]
    public class CreateModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
  

        public CreateModel(IUnitOfWork unitOfWork, ISubjectRepository subjectRepository)
        {
            _unitOfWork = unitOfWork;
            
        }

        [BindProperty]
        public QuestionAnswerViewModel QuestionAnswer { get; set; }
        public List<Chapter> Chapters { get; set; }
        public async Task OnGet(int? subjectId = null)
        {

            if (QuestionAnswer == null)
            {
                QuestionAnswer = new QuestionAnswerViewModel();
            }

            // Tạo câu trả lời mặc định
            QuestionAnswer.Answers = new List<AnswerViewModel>
            {
                new AnswerViewModel(),
                new AnswerViewModel(),
                new AnswerViewModel(),
                new AnswerViewModel()
            };
            QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
            if (subjectId.HasValue)
            {
                Chapters = await _unitOfWork.Chapters.GetAllChaptersBySubjectId(subjectId.Value);
            }
            else
            {
                Chapters = new List<Chapter>();
            }
        }
        public async Task<IActionResult> OnGetChaptersBySubjectIdAsync(int subjectId)
        {
            var chapters = await _unitOfWork.Chapters.GetAllChaptersBySubjectId(subjectId);
            return new JsonResult(chapters);
        }
        public async Task<IActionResult> OnPostAsync()
        {
            
            if (QuestionAnswer.SubjectId == null || QuestionAnswer.SubjectId <= 0|| QuestionAnswer.ChapterId == null || QuestionAnswer.ChapterId <= 0)
            {
                ModelState.AddModelError("", "Please select a subject and chapter for the question.");
                await ReloadDropdownDataAsync();
                return Page();
            }
            if (!QuestionAnswer.IsMultipleChoice)
            {
                var correctAnswers = QuestionAnswer.Answers.Count(a => a.Correct);
                if (correctAnswers != 1)
                {
                    ModelState.AddModelError("", "Please choose one correct answer.");
                    await ReloadDropdownDataAsync();
                    return Page();
                }
            }
            else
            {
                var correctAnswers = QuestionAnswer.Answers.Count(a => a.Correct);
                if (correctAnswers < 2)
                {
                    ModelState.AddModelError("", "Please choose at least two correct answers.");
                    await ReloadDropdownDataAsync();
                }
            }
            if (!ModelState.IsValid)
            {
                await ReloadDropdownDataAsync();
                return Page();
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

            await ReloadDropdownDataAsync();
            return RedirectToPage("Index");
        }
        private async Task ReloadDropdownDataAsync()
        {
            // Lấy danh sách Subjects
            QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();

            
            if (QuestionAnswer.SubjectId.HasValue && QuestionAnswer.SubjectId.Value > 0)
            {
                Chapters = await _unitOfWork.Chapters.GetAllChaptersBySubjectId(QuestionAnswer.SubjectId.Value);
            }
            else
            {
                Chapters = new List<Chapter>();
            }
        }
    }
}
