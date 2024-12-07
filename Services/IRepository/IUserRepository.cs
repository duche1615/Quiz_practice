using Quizpractice.Models;
using Quizpractice.ViewModels;

namespace Quizpractice.Services.IRepository
{
    public interface IUserRepository:IBaseRepository<User>
    {
        Task<User> FindById(int value);
        Task<List<User>> GetAllUsers();
        Task<User> LoginAsync(LoginViewModel loginModel);
        Task<User> RegisterUserAsync(RegisterViewModel registerModel);
        bool UpdateUser(User user);
    }
}
