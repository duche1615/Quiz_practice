using Quizpractice.Models;
using Quizpractice.ViewModels;

namespace Quizpractice.Services.IRepository
{
    public interface IUserRepository
    {
        Task<List<User>> GetAllUsers();
        Task<User> FindById(int id);
        bool UpdateUser(User user);
        Task<User> RegisterUserAsync(RegisterViewModel registerModel);
        Task<User> LoginAsync(LoginViewModel loginModel);
    }
}
