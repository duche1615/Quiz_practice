using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;

namespace Quizpractice.Pages.Quizs
{
    public class QuizDetailModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public QuizDetailModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public List<QuizDetailViewModel> PaginatedResults { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
        public int PageSize { get; set; } = 5; // Number of records per page

        public void OnGet(int page = 1)
        {
            CurrentPage = page;

            // Fetch all quiz details from the database
            var allResults = _context.QuizDetails
                .OrderByDescending(q => q.TakenDate)
                .Select(q => new QuizDetailViewModel
                {
                    QuizId = q.QuizId,
                    SubjectId = q.Quiz.SubId,
                    Score = q.Score,
                    TakenDate = q.TakenDate,
                    Attempt = _context.QuizDetails
                        .Where(d => d.UserId == q.UserId && d.QuizId == q.QuizId)
                        .Count()
                })
                .ToList();

            // Calculate total pages
            TotalPages = (int)System.Math.Ceiling(allResults.Count / (double)PageSize);

            // Get the paginated results
            PaginatedResults = allResults
                .Skip((CurrentPage - 1) * PageSize)
                .Take(PageSize)
                .ToList();
        }

        public class QuizDetailViewModel
        {
            public int QuizId { get; set; }

            public int? SubjectId { get; set; }
            public int Score { get; set; }
            public double Percentage => Score / 10.0 * 100; // Assuming max score = 10
            public int Attempt { get; set; }
            public System.DateTime TakenDate { get; set; }
        }
    }
}
