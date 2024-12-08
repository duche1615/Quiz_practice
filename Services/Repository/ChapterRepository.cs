using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class ChapterRepository : IChapterRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public ChapterRepository( SWP391_DBContext dbContext )
        {
            _dbContext = dbContext;
        }

        public async Task<List<Chapter>> GetAllChapters()
        {
           return await _dbContext.Chapters.ToListAsync();
        }

        public async Task<List<Chapter>> GetAllChaptersBySubjectId(int id)
        {
            return await _dbContext.Chapters.Where(c=>c.SubId == id).ToListAsync(); 
        }

        public Task<Chapter> GetChapterById(int id)
        {
            return _dbContext.Chapters.FirstAsync(c=>c.ChapterId == id);
        }
    }
}
