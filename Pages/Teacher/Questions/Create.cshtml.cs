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

        public CreateModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public QuestionAnswerViewModel QuestionAnswer { get; set; }

        public void OnGet()
        {
            // create answer mặc định
            QuestionAnswer = new QuestionAnswerViewModel
            {
                Answers = new List<AnswerViewModel>
            {
                new AnswerViewModel(),
                new AnswerViewModel(),
                new AnswerViewModel(),
                new AnswerViewModel()
            }
            };
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page(); 
            }
            if (!QuestionAnswer.IsMultipleChoice)
            {
                var correctAnswers = QuestionAnswer.Answers.Count(a => a.Correct);
                if (correctAnswers != 1)
                {
                    ModelState.AddModelError(string.Empty, "chose one answer please");
                    return Page();
                }
            }
            else
            {
                var correctAnswers = QuestionAnswer.Answers.Count(a => a.Correct);
                if (correctAnswers < 2)
                {
                    ModelState.AddModelError(string.Empty, "chose more two answer please");
                    return Page(); 
                }
            }
            // create question
            var question = new Question
            {
                Content = QuestionAnswer.Content,
                //SubjectId = QuestionAnswer.SubjectId,
                //LessonId = QuestionAnswer.LessonId,
                //TopicId = QuestionAnswer.TopicId,
                Status =true,
                Level = QuestionAnswer.Level,
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

            
            return RedirectToPage("Index");
        }
    }
}
