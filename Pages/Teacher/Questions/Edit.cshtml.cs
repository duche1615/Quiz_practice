using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Services.IRepository;
using Quizpractice.ViewModels;
namespace Quizpractice.Pages.Teacher.Questions
{
    public class EditModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public EditModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public QuestionAnswerViewModel QuestionAnswer { get; set; }

        public async Task<IActionResult> OnGet(int id)
        {
            
            // Initialize the ViewModel if it's null
            if (QuestionAnswer == null)
            {
                QuestionAnswer = new QuestionAnswerViewModel();
            }

            // Fetch the question to be edited
            var question = await _unitOfWork.Questions.GetByIdAsync(id);

            if (question == null)
            {
                // If no question found, redirect to an error page or index
                return RedirectToPage("/Error"); 
            }

            // Load the data for the question
            QuestionAnswer.Id = question.QuestionId;
            QuestionAnswer.Content = question.Content;
            QuestionAnswer.Level = question.Level;
            QuestionAnswer.SubjectId = question.SubjectId;
            QuestionAnswer.ChapterId = question.ChapterId;
            QuestionAnswer.IsMultipleChoice = question.IsMultipleChoice ?? false;

            // Fetch the answers for the question and map to ViewModel
            var answers = await _unitOfWork.Answers.GetAnswersByQuestionIdAsync(question.QuestionId);
            QuestionAnswer.Answers = answers.Select(a => new AnswerViewModel
            {
                Id = a.AnswerId,
                Content = a.Content,
                Correct = a.Correct == true
            }).ToList();

            // Load subjects and chapters
            QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
            QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();

            return Page(); 
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (QuestionAnswer == null)
            {
                QuestionAnswer = new QuestionAnswerViewModel();
            }
            if (!ModelState.IsValid)
            {               
                QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }

            // Validate subject and chapter selection
            if (QuestionAnswer.SubjectId == null || QuestionAnswer.SubjectId <= 0 ||
                QuestionAnswer.ChapterId == null || QuestionAnswer.ChapterId <= 0)
            {
                ModelState.AddModelError(string.Empty, "Please select a subject and chapter for the question.");
                QuestionAnswer.Subjects = await _unitOfWork.Subjects.GetAllSubjects();
                QuestionAnswer.Chapters = await _unitOfWork.Chapters.GetAllChapters();
                return Page();
            }

            // Fetch the existing question
            var question = await _unitOfWork.Questions.GetByIdAsync(QuestionAnswer.Id);
            if (question == null)
            {
                ModelState.AddModelError(string.Empty, "Question not found.");
                return RedirectToPage("Index");
            }

            // Validate correct answers based on multiple choice status
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

            // Update the question
            question.Content = QuestionAnswer.Content;
            question.Level = QuestionAnswer.Level;
            question.SubjectId = QuestionAnswer.SubjectId.Value;
            question.ChapterId = QuestionAnswer.ChapterId.Value;
            question.IsMultipleChoice = QuestionAnswer.IsMultipleChoice;

            // Update the question in the database
            await _unitOfWork.Questions.UpdateAsync(question);

            // Update the answers
            foreach (var answerViewModel in QuestionAnswer.Answers)
            {
                var answer = await _unitOfWork.Answers.GetByIdAsync(answerViewModel.Id);
                if (answer != null)
                {
                    answer.Content = answerViewModel.Content;
                    answer.Correct = answerViewModel.Correct;
                    answer.QuesId = question.QuestionId; // Đảm bảo liên kết đúng câu hỏi
                    await _unitOfWork.Answers.UpdateAsync(answer);
                }                
            }

            // Save the changes to the database
            await _unitOfWork.SaveAsync();

            // Redirect to the Index page after successful update
            return RedirectToPage("Index");
        }

    }
}
