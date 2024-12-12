using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Lessions
{
    public class DetailsModel : PageModel
    {
        private readonly ILessionRepository _lessionRepository;
        private readonly ISubjectRepository _subjectRepository;
        private readonly IChapterRepository _chapterRepository;
        public DetailsModel(ILessionRepository lessionRepository, ISubjectRepository subjectRepository, IChapterRepository chapterRepository)
        {
            _lessionRepository = lessionRepository;
            _subjectRepository = subjectRepository;
            _chapterRepository = chapterRepository;
        }
        [BindProperty]
        public Lession Lession { get; set; }
        [BindProperty]
        public IList<Subject> Subject { get; set; }
        [BindProperty]
        public IList<Chapter> Chapter { get; set; }

        public IActionResult OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Lession = _lessionRepository.GetLessionById(id.Value).Result;
            Subject = _subjectRepository.GetAllSubjects().Result;
            Chapter = _chapterRepository.GetAllChapters().Result;
            if (Lession == null || Subject == null || Chapter == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
