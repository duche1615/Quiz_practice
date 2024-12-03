using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class SubjectRepository : ISubjectRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public SubjectRepository(SWP391_DBContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Subject>> GetAllSubjects()
        {
            return await _dbContext.Subjects.ToListAsync();
        }
        public async Task<Subject> GetById(int id)
        {
            return await _dbContext.Subjects.FirstAsync(s => s.SubjectId == id);
        }
    }
}
