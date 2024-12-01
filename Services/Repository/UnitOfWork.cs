using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly SWP391_DBContext _context;

        public UnitOfWork(SWP391_DBContext context)
        {
            _context = context;
            Questions = new QuestionRepository(_context);
            Answers = new AnswerRepository(_context);
        }

        public IQuestionRepository Questions { get; private set; }
        public IAnswerRepository Answers { get; private set; }

        public async Task SaveAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
