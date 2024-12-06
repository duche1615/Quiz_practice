using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class AnswerRepository : BaseRepository<Answer>, IAnswerRepository
    {
        private readonly SWP391_DBContext _context;

        public AnswerRepository(SWP391_DBContext context) : base(context)
        {
            _context = context;
        }


        public async Task AddAnswerAsync(Answer answer)
        {
            await AddAsync(answer);
        }
        public async Task<IEnumerable<Answer>> GetAnswersByQuestionIdAsync(int questionId)
        {
            return await _context.Answers
                .Where(a => a.QuesId == questionId)
                .ToListAsync();
        }
    }
}
