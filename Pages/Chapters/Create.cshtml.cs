using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Chapters
{
    [Authorize(Roles = "Admin")]

    public class CreateModel : PageModel
    {
        private readonly IChapterRepository _chapterRepository;
        private readonly ISubjectRepository _subjectRepository;
        public CreateModel(IChapterRepository chapterRepository, ISubjectRepository subjectRepository)
        {
            _chapterRepository = chapterRepository;
            _subjectRepository = subjectRepository;
        }

        [BindProperty]
        public Chapter Chapter { get; set; } = default!;
        public IList<Subject> Subjects { get; set; } = default!;

        [BindProperty]
        public int ChapterId { get; set; } = default!;
        [BindProperty]
        public string ChapterName { get; set; } = default!;
        [BindProperty]
        public string Content { get; set; } = default!;
        [BindProperty]
        public bool Active { get; set; } = default!;
        [BindProperty]
        public bool Public { get; set; } = default!;
        [BindProperty]
        public int SubId { get; set; } = default!;
        [BindProperty]
        public string Description { get; set; } = default!;


        public async Task<IActionResult> OnGet()
        {
            Subjects = await _subjectRepository.GetAllSubjects();
            if (Subjects == null)
            {
                return NotFound();
            }
            ViewData["Subid"] = new SelectList(Subjects, "SubjectId", "SubjectName");
            return Page();
        }


        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            Chapter rawChapter = new Chapter()
            {
                ChapterId = ChapterId,
                Active = Active,
                Public = Public,
                ChapterName = ChapterName,
                Content = Content,
                Description = Description,
                SubId = SubId,
            };
            if (_chapterRepository.CreateChapter(rawChapter))
            {
                return RedirectToPage("./Index");
            }
            return Page();
        }
    }
}
