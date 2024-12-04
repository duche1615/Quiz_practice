using Quizpractice.Models;
using Quizpractice.Pages.Questions;
using System.ComponentModel.DataAnnotations;

namespace Quizpractice.ViewModels
{
    public class QuestionAnswerViewModel
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public string Level { get; set; }
        public bool IsMultipleChoice { get; set; }
        public string? Status { get; set; }
        public string? SubjectName { get; set; }
        public string? ChapterName { get; set; }
        public int? SubjectId { get; set; }

        public IEnumerable<Subject> Subjects { get; set; } = new List<Subject>();
        public List<AnswerViewModel> Answers { get; set; } = new List<AnswerViewModel>();
    }
}
