using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class QuizRepository : BaseRepository<Quiz>, IQuizRepository
    {
        private readonly SWP391_DBContext _context;
        public QuizRepository(SWP391_DBContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Quiz>> GetAllQuizzesAsync()
        {
            return await GetAllAsync();
        }

        public async Task<IEnumerable<Quiz>> GetQuizzesWithPaginationAsync(int subjectId, int pageNumber, int pageSize, string searchTerm = "")
        {
            var query = _context.Quizzes.AsQueryable();

           
            if (subjectId > 0)
            {
                query = query.Where(q => q.SubId == subjectId);
            }

            
            if (!string.IsNullOrEmpty(searchTerm))
            {
                query = query.Where(q => q.Title.Contains(searchTerm) || q.Description.Contains(searchTerm));
            }

            
            return await query
                .Skip((pageNumber - 1) * pageSize)  
                .Take(pageSize)                    
                .Include(q => q.Sub)           
                .ToListAsync();                     
        }

        
        public async Task<int> GetTotalQuizzesCountAsync(int subjectId, string searchTerm = "")
        {
            var query = _context.Quizzes.AsQueryable();

            
            if (subjectId > 0)
            {
                query = query.Where(q => q.SubId == subjectId);
            }

            
            if (!string.IsNullOrEmpty(searchTerm))
            {
                query = query.Where(q => q.Title.Contains(searchTerm) || q.Description.Contains(searchTerm));
            }

            return await query.CountAsync(); 
        }

        public async Task<Quiz> GetQuizByIdAsync(int quizId)
        {
            return await GetByIdAsync(quizId);
        }
        
        public async Task UpdateQuizStatusAsync(int quizId, bool newActive)
        {
            var quiz = await _context.Quizzes.FindAsync(quizId);
            if (quiz != null)
            {
                quiz.Active = newActive; 
                await _context.SaveChangesAsync(); 
            }
        }

        public async Task AddQuestionToQuizAsync(QuestionQuiz quizQuestion)
        {
            await _context.QuestionQuizzes.AddAsync(quizQuestion);
            await _context.SaveChangesAsync();
        }

    }
}
