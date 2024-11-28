using Quizpractice.Models.Entities;

namespace Quizpractice.Services
{

    public interface ICategoryRepository
    {
        public Task<List<Category>> GetAllCategories();
    }
}
