using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models.Entities;
using Quizpractice.Services;

namespace Quizpractice.Pages.Categories
{
    public class IndexModel : PageModel
    {
        private readonly ICategoryRepository _categoriaRepository;
        
        public IndexModel(ICategoryRepository categoriaRepository)
        {
            _categoriaRepository = categoriaRepository;
        }

        public IList<Category> Category { get; set; } = default!;

        public async Task OnGetAsync()
        {
            Category= await _categoriaRepository.GetAllCategories();
        }
    }
}
