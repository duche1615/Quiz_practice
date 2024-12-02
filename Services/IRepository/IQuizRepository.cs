using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IQuizRepository : IBaseRepository<Quiz>
    {
        
        Task<IEnumerable<Quiz>> GetAllQuizzesAsync();
        Task<Quiz> GetQuizByIdAsync(int quizId);
        Task UpdateQuizStatusAsync(int quizId, bool newStatus);
    }
}
