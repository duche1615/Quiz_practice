using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.EFCore;
using Quizpractice.Models.Entities;

namespace Quizpractice.Services
{
    public class SubjectRepository : ISubjectRepository
    {
        private readonly QuizPracticeContext _context;
        public SubjectRepository(QuizPracticeContext context)
        {
            this._context = context;
        }

        public async Task<List<Subject>> GetAllSubjects()
        {
            return await _context.Subjects.ToListAsync();
        }
    }
}
