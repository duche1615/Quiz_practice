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
    }
}
