using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class QuestionRepository : BaseRepository<Question>, IQuestionRepository
    {
        private readonly SWP391_DBContext _context;
        public QuestionRepository(SWP391_DBContext context) : base(context)
        {
            _context = context;
        }
        public async Task<Question> GetQuestionWithAnswersAsync(int questionId)
        {
            return await _context.Questions
                .Include(q => q.Answers) 
                .Include(q => q.Subject) 
                .Include(q => q.Lesson) 
                .Include(q => q.Topic) 
                .FirstOrDefaultAsync(q => q.QuestionId == questionId);
        }

        public async Task<IEnumerable<Question>> GetQuestionsWithDetailsAsync()
        {
            return await _context.Questions
                .Include(q => q.Subject)
                .Include(q => q.Lesson)
                .Include(q => q.Topic)
                .ToListAsync();
        }
        public async Task AddQuestionAsync(Question question)
        {
            await AddAsync(question);
        }

    }
    

}
