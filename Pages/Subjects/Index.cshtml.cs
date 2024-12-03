using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Subjects
{
    public class IndexModel : PageModel
    {
        private readonly ISubjectRepository _subjectRepository;
        private readonly IChapterRepository _chapterRepository;
        public IndexModel(ISubjectRepository subjectRepository, IChapterRepository chapterRepository)
        {
            _subjectRepository = subjectRepository;
            _chapterRepository = chapterRepository;
        }

        public IList<Subject> Subject { get;set; } = default!;
        public IList<Chapter> Chapters { get;set; }=default!;

        public ActionResult OnGetAsync()
        {
            Subject=_subjectRepository.GetAllSubjects().Result;
            Chapters=_chapterRepository.GetAllChapters().Result;
            if (Subject != null&&Chapters!=null)
            {
                return Page();
            }
            else
            {
                return NotFound();
            }
        }
    }
}
