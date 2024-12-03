using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IRoleRepository
    {
        Task<List<Role>> GetAllRoles();
        Task<Role> GetById(int id);
    }
}
