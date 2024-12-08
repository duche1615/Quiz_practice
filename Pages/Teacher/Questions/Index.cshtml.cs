using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.Services.Repository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Questions
{
    //[Authorize(Roles = "Teacher")]
    public class IndexModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public IndexModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;

        }
        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; } = string.Empty;
        [BindProperty(SupportsGet = true)]
        public int CurrentPage { get; set; } = 1;

        [BindProperty(SupportsGet = true)]
        public int PageSize { get; set; } = 10;

        public int TotalPages { get; set; }

        [BindProperty(SupportsGet = true)]
        public int? SelectedSubjectId { get; set; } 

        public IEnumerable<Subject> Subjects { get; set; } 
        public IEnumerable<QuestionAnswerViewModel> Questions { get; set; }
        public IEnumerable<Question> questions { get; set; }
        public async Task OnGetAsync()
        {
            Subjects = await _unitOfWork.Subjects.GetAllSubjects();
           

            if (SelectedSubjectId.HasValue && SelectedSubjectId > 0)
            {
                var totalQuestions = await _unitOfWork.Questions.GetTotalQuestionsCountAsync(SelectedSubjectId.Value, SearchTerm);
                TotalPages = (int)Math.Ceiling(totalQuestions / (double)PageSize);

                questions = await _unitOfWork.Questions.GetAllQuestionsWithPaginationAsync(SelectedSubjectId.Value, CurrentPage, PageSize, SearchTerm);
            }
            else
            {
                var totalQuestions = await _unitOfWork.Questions.GetTotalQuestionsCountAsync(0,SearchTerm);
                TotalPages = (int)Math.Ceiling(totalQuestions / (double)PageSize);

                questions = await _unitOfWork.Questions.GetAllQuestionsWithPaginationAsync(0,CurrentPage, PageSize, SearchTerm);
            }


            Questions = questions.Select(q => new QuestionAnswerViewModel
            {
                Id = q.QuestionId,
                Content = q.Content,
                Level = q.Level,
                IsMultipleChoice = q.IsMultipleChoice ?? false,
                Status = q.Status == true ? "Active" : "Inactive",
                SubjectName = q.Subject?.SubjectName ?? "N/A",              
                ChapterName = q.Chapter?.ChapterName ?? "N/A"
            }).ToList();
            
        }

        public async Task<IActionResult> OnPostChangeStatusAsync(int questionId)
        {
            // Fetch the question and toggle its status
            var question = await _unitOfWork.Questions.GetQuestionWithAnswersAsync(questionId);
            if (question != null)
            {
                question.Status = question.Status ?? false; 
                question.Status = !question.Status; 

                await _unitOfWork.SaveAsync();
            }

            return RedirectToPage(); 
        }

    }
}
