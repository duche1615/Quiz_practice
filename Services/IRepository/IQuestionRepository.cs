using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IQuestionRepository : IBaseRepository<Question>
    {

        Task<IEnumerable<Question>> GetAllQuestionsWithPaginationAsync(int subjectId, int pageNumber, int pageSize, string searchTerm = "");
        Task<Question> GetQuestionWithAnswersAsync(int questionId);
        Task AddQuestionAsync(Question question);
        Task<IEnumerable<Question>> SearchQuestionsByContentAsync(string searchTerm);
        Task UpdateQuestionStatusAsync(int questionId, bool newStatus);
        Task<int> GetTotalQuestionsCountAsync(int subjectId, string searchTerm = "");

    }


}

