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

        public async Task<Quiz> GetQuizByIdAsync(int quizId)
        {
            return await GetByIdAsync(quizId);
        }
        
        public async Task UpdateQuizStatusAsync(int quizId, bool newStatus)
        {
            var quiz = await _context.Quizzes.FindAsync(quizId);
            if (quiz != null)
            {
                quiz.Status = newStatus; 
                await _context.SaveChangesAsync(); 
            }
        }

    }
}
