using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public UserRepository( SWP391_DBContext dbContext )
        {
            _dbContext = dbContext;
        }
        public async Task<List<User>> GetAllUsers()
        {
            return await _dbContext.Users.Include(u => u.Role).ToListAsync();
        }
    }
}
