using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.EFCore;
using Quizpractice.Models.Entities;

namespace Quizpractice.Services
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly QuizPracticeContext _context;
        public CategoryRepository(QuizPracticeContext context)
        {
            _context = context;
        }
        public async Task<List<Category>> GetAllCategories()
        {
            return await _context.Categories.ToListAsync();
        }
    }
}
