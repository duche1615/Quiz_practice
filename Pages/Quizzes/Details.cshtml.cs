using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Quizzes
{
    public class DetailsModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IQuizDetailRepository _quizDetailRepository;
        public DetailsModel(IUnitOfWork unitOfWork, IQuizDetailRepository quizDetailRepository)
        {
            _unitOfWork = unitOfWork;
            _quizDetailRepository = quizDetailRepository;
        }
        public Quiz Quiz { get; set; }
        public int total { get; set; }
        public int count { get; set; }
        public async Task<IActionResult> OnGet(int id)
        {
            Quiz = await _unitOfWork.Quizzes.GetQuizByIdAsync(id);
            if (Quiz == null)
            {
                return NotFound();
            }
            total = _quizDetailRepository.CountQuizAttempt(id);
            count = _quizDetailRepository.CountQuizPass(id); 
            return Page();
        }
    }
}
