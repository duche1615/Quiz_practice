using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Teacher.Quizzes
{
    public class DetailsModel : PageModel
    {
        private readonly IQuizRepository _quizRepository;
        public DetailsModel(IQuizRepository quizRepository)
        {
            _quizRepository = quizRepository;
        }
        public Quiz Quiz { get; set; }
        public async Task OnGet(int id)
        {
            Quiz = await _quizRepository.GetQuizByIdAsync(id);
            if (Quiz == null)
            {
                RedirectToPage("Index");
            }

        }
    }
}
