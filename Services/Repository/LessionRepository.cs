using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class LessionRepository : ILessionRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public LessionRepository( SWP391_DBContext dbContext )
        {
            _dbContext = dbContext;
        }

        public async Task<List<Lession>> GetAllLessions()
        {
            return await _dbContext.Lessions.ToListAsync();
        }

        public async Task<List<Lession>> GetAllLessionsByChapterId(int id)
        {
            return await _dbContext.Lessions.Where(c=>c.Chapterid==id).ToListAsync();
        }

        public async Task<Lession> GetLessionById(int id)
        {
            return await _dbContext.Lessions.FirstAsync(l=>l.LessionId==id);
        }

        public bool UpdateLession(Lession lession)
        {
            try
            {
                _dbContext.Lessions.Update(lession);
                _dbContext.SaveChanges();
            }catch (Exception ex)
            {
                return false;
            }
            return true;
        }
    }
}
