using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IQuizRepository : IBaseRepository<Quiz>
    {
        
        Task<IEnumerable<Quiz>> GetAllQuizzesAsync();
        Task<IEnumerable<Quiz>> GetQuizzesWithPaginationAsync(int subjectId, int pageNumber, int pageSize, string searchTerm = "");
        Task<int> GetTotalQuizzesCountAsync(int subjectId, string searchTerm = "");
        Task<Quiz> GetQuizByIdAsync(int quizId);
        Task UpdateQuizStatusAsync(int quizId, bool newStatus);
        Task AddQuestionToQuizAsync(QuestionQuiz quizQuestion);
    }
}
