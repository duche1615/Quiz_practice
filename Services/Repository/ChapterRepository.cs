using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class ChapterRepository : IChapterRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public ChapterRepository(SWP391_DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public bool CreateChapter(Chapter chapter)
        {
            if (chapter == null)
            {
                return false;
            }
            try
            {
                _dbContext.Add(chapter);
                _dbContext.SaveChanges();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        public async Task<List<Chapter>> GetAllChapters()
        {
            return await _dbContext.Chapters.OrderBy(c => c.SubId).ToListAsync();
        }

        public async Task<List<Chapter>> GetAllChaptersBySubjectId(int id)
        {
            return await _dbContext.Chapters.Where(c => c.SubId == id).ToListAsync();
        }

        public Task<Chapter> GetChapterById(int id)
        {
            return _dbContext.Chapters.FirstAsync(c => c.ChapterId == id);
        }

        public bool UpdateChapter(Chapter chapter)
        {
            try
            {
                _dbContext.Chapters.Update(chapter);
                _dbContext.SaveChanges();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;

        }
    }
}
