using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.Services.Repository;
using Quizpractice.ViewModels;

namespace Quizpractice.Pages.Teacher.Quizzes
{
    public class IndexModel : PageModel
    {
        private readonly IQuizRepository _quizRepository;
        private readonly ISubjectRepository _subjectRepository;

        public IndexModel(IQuizRepository quizRepository, ISubjectRepository subjectRepository)
        {
            _quizRepository = quizRepository;
            _subjectRepository = subjectRepository;
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
        public IEnumerable<QuizViewModel> Quizzes { get; set; }
        public async Task OnGetAsync()
        {
            Subjects = await _subjectRepository.GetAllSubjects();

            // Initialize the queries
            IEnumerable<Quiz> quizzes;
            if (SelectedSubjectId.HasValue && SelectedSubjectId > 0)
            {
                
                var totalQuizzes = await _quizRepository.GetTotalQuizzesCountAsync(SelectedSubjectId.Value, SearchTerm);
                TotalPages = (int)Math.Ceiling(totalQuizzes / (double)PageSize);
                quizzes = await _quizRepository.GetQuizzesWithPaginationAsync(SelectedSubjectId.Value, CurrentPage, PageSize, SearchTerm);               
            }
            else
            {               
                var totalQuizzes = await _quizRepository.GetTotalQuizzesCountAsync(0, SearchTerm);
                TotalPages = (int)Math.Ceiling(totalQuizzes / (double)PageSize);
                quizzes = await _quizRepository.GetQuizzesWithPaginationAsync(0, CurrentPage, PageSize, SearchTerm);                
            }



            Quizzes = quizzes.Select(q => new QuizViewModel
            {
                QuizId = q.QuizId,
                Title = q.Title,
                Level = q.Level,
                Description = q.Description,
                SubjectName = q.Sub.SubjectName,
                Duration = (int)q.Duration,
                Status = q.Active == true ? "Active" : "Inactive", 
                TotalQues = q.TotalQues,              
            }).ToList();
            
        }

        public async Task<IActionResult> OnPostChangeQuizStatusAsync(int quizId)
        {
            var quiz = await _quizRepository.GetQuizByIdAsync(quizId);

            if (quiz != null)
            {
                
                quiz.Active = quiz.Active ?? false;

                
                quiz.Active = !quiz.Active;

                await _quizRepository.UpdateQuizStatusAsync(quizId,quiz.Active.Value); 
            }

            return RedirectToPage(); 
        }
    }
}
