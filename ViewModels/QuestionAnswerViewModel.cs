using Quizpractice.Models;
using Quizpractice.Pages.Questions;
using System.ComponentModel.DataAnnotations;

namespace Quizpractice.ViewModels
{
    public class QuestionAnswerViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Content is required.")]
        [StringLength(500, MinimumLength = 5, ErrorMessage = "Content must be between 10 and 500 characters.")]
        public string Content { get; set; }
        public string Level { get; set; }
        public bool IsMultipleChoice { get; set; }
        public string? Status { get; set; }
        public string? SubjectName { get; set; }
        public string? ChapterName { get; set; }
        public int? SubjectId { get; set; }
        public int? ChapterId { get; set; }
        public IEnumerable<Subject>? Subjects { get; set; } = new List<Subject>();
        public IEnumerable<Chapter>? Chapters { get; set; } = new List<Chapter>();
        public List<AnswerViewModel>? Answers { get; set; } = new List<AnswerViewModel>();
    }
}
