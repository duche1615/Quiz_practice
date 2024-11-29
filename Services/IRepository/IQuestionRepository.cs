using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IQuestionRepository : IBaseRepository<Question>
    {
       
        Task<IEnumerable<Question>> GetQuestionsWithDetailsAsync();
        Task<Question> GetQuestionWithAnswersAsync(int questionId);
    }

    public interface IAnswerRepository : IBaseRepository<Answer>
    {
    }
}

