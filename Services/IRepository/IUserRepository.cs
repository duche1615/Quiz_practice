using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IUserRepository
    {
        Task<List<User>> GetAllUsers();
    }
}
