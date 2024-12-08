using Quizpractice.Models;
using Quizpractice.ViewModels;

namespace Quizpractice.Services.IRepository
{
    public interface IUserRepository:IBaseRepository<User>
    {
        Task<User> FindById(int value);
        Task<List<User>> GetAllUsers();
        Task<User> LoginAsync(LoginViewModel loginModel);
        Task<bool> CheckEmailExistAsync(string email);
        Task<User> RegisterUserAsync(RegisterViewModel registerModel);
        bool UpdateUser(User user);
        Task<bool> ValidatePassword(User user, string password);
        Task<bool> UpdatePasswordAsync(User user, string newPassword);
    }
}
