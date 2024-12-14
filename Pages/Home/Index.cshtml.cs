using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Home
{
    [AllowAnonymous]
    public class IndexModel : PageModel
    {
        private readonly ISubjectRepository _subjectRepository;



        public IndexModel(ISubjectRepository subjectRepository)
        {
            _subjectRepository = subjectRepository;
        }

        public List<Subject> Subjects { get; set; }

        public async Task OnGetAsync()
        {
            // Fetching data from repositories
            Subjects = await _subjectRepository.GetAllSubjects();
        }
    }
}

