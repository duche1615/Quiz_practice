using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Chapters
{
    public class EditModel : PageModel
    {
        private readonly IChapterRepository _chapterRepository;
        private readonly ISubjectRepository _subjectRepository;
        public EditModel(IChapterRepository chapterRepository, ISubjectRepository subjectRepository)
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


        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Chapter = await _chapterRepository.GetChapterById(id.Value);
            Subjects = await _subjectRepository.GetAllSubjects();
            if (Chapter == null || Subjects == null)
            {
                return NotFound();
            }
            ViewData["Subid"] = new SelectList(Subjects, "SubjectId", "SubjectName");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            Chapter editedChapter = new Chapter()
            {
                ChapterId = ChapterId,
                Active = Active,
                Public = Public,
                ChapterName = ChapterName,
                Content = Content,
                Description = Description,
                SubId = SubId,
            };
            if (_chapterRepository.UpdateChapter(editedChapter))
            {
                return RedirectToPage("./Index");
            }
            return Page();
        }
    }
}
