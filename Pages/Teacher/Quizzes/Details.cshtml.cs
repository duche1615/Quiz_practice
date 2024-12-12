using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Teacher.Quizzes
{
    [Authorize(Roles = "Lecturer")]
    public class DetailsModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        public DetailsModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public Quiz Quiz { get; set; }
        public async Task<IActionResult> OnGet(int id)
        {
            Quiz = await _unitOfWork.Quizzes.GetQuizByIdAsync(id);
            if (Quiz == null)
            {
               return NotFound();
            }
            return Page();
        }
    }
}
