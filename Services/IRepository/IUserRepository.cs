using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IUserRepository
    {
        Task<List<User>> GetAllUsers();
        Task<User> FindById(int id);
        bool UpdateUser(User user);
    }
}
