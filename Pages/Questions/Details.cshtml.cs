using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Questions
{
    public class DetailsModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public DetailsModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public Question Question { get; set; }
        
        public async Task<IActionResult> OnGetAsync( int id)
        {
            
            Question = await _unitOfWork.Questions.GetQuestionWithAnswersAsync(id);

            if (Question == null)
            {
                return NotFound();
            }

            return Page();
        }
    }
}

