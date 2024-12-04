using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using System.Drawing.Printing;

namespace Quizpractice.Services.Repository
{
    public class QuestionRepository : BaseRepository<Question>, IQuestionRepository
    {
        private readonly SWP391_DBContext _context;
        public QuestionRepository(SWP391_DBContext context) : base(context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Question>> GetAllQuestionsWithPaginationAsync(int subjectId,int pageNumber, int pageSize, string searchTerm = "")
        {
            
            var query =  _context.Questions
                .Include(q => q.Chapter)
                .Include(q => q.Subject)                
                .AsQueryable();
            if (subjectId > 0)
            {
                query = query.Where(q => q.SubjectId == subjectId);
            }
            if (!string.IsNullOrEmpty(searchTerm))
            {
                query = query.Where(q => q.Content.Contains(searchTerm));
            }
            return await query
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

        }
        public async Task<Question> GetQuestionWithAnswersAsync(int questionId)
        {
            return await _context.Questions
                .Include(q => q.Answers) 
                .Include(q => q.Chapter) 
                .Include(q => q.Subject) 
                .FirstOrDefaultAsync(q => q.QuestionId == questionId);
        }

        
        public async Task AddQuestionAsync(Question question)
        {
            await AddAsync(question);
        }

        public async Task<IEnumerable<Question>> SearchQuestionsByContentAsync(string searchTerm)
        {
            return await _context.Questions
                .Include(q => q.Chapter)
                .Include(q => q.Subject)              
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

        public async Task<int> GetTotalQuestionsCountAsync(int subjectId, string searchTerm = "")
        {
            var query = _context.Questions.AsQueryable();

            if (subjectId > 0)
            {
                query = query.Where(q => q.SubjectId == subjectId);
            }

            if (!string.IsNullOrEmpty(searchTerm))
            {
                query = query.Where(q => q.Content.Contains(searchTerm));
            }

            return await query.CountAsync();
        }

    }


}
