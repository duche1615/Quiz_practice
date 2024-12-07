using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IAnswerRepository : IBaseRepository<Answer>
    {
        Task AddAnswerAsync(Answer answer);
        Task<IEnumerable<Answer>> GetAnswersByQuestionIdAsync(int questionId);
    }
}
