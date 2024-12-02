using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class RoleRepository : IRoleRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public RoleRepository(SWP391_DBContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Role>> GetAllRoles()
        {
            return await _dbContext.Roles.ToListAsync();
        }

        public async Task<Role> GetById(int id)
        {
            return await _dbContext.Roles.FirstAsync(r=>r.RoleId == id);
        }
    }
}
