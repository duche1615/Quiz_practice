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
        public async Task<IEnumerable<Question>> GetAllQuestionsAsync()
        {
            return await _context.Questions
                .Include(q => q.Subject)
                .Include(q => q.Lesson)
                .Include(q => q.Topic)
                .ToListAsync();
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

        
        public async Task AddQuestionAsync(Question question)
        {
            await AddAsync(question);
        }

        public async Task<IEnumerable<Question>> SearchQuestionsByContentAsync(string searchTerm)
        {
            return await _context.Questions
                .Include(q => q.Subject)
                .Include(q => q.Lesson)
                .Include(q => q.Topic)
                .Where(q => q.Content.Contains(searchTerm))
                .ToListAsync();
        }

        public async Task UpdateQuestionStatusAsync(int questionId, bool newStatus)
        {
            var question = await _context.Questions.FindAsync(questionId);
            if (question != null)
            {
                question.Status = newStatus;
                await _context.SaveChangesAsync();
            }
        }

    }


}
