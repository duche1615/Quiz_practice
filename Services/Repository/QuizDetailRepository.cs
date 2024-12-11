using Quizpractice.Models;
using Quizpractice.Services.IRepository;
namespace Quizpractice.Services.Repository
{
    public class QuizDetailRepository : IQuizDetailRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public QuizDetailRepository(SWP391_DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public int CountQuizAttempt(int quizId)
        {
            return _dbContext.QuizDetails.Count(qd => qd.QuizId == quizId);
        }

        public int CountQuizPass(int quizId)
        {
            double score = _dbContext.Quizzes.First(q => q.QuizId == quizId).PassPercent.Value;
            if (score <= 0) {
                return 0;
            }
            else
            {
                return _dbContext.QuizDetails.Count(qd=>qd.Score>=score);
            }
        }
    }
}
