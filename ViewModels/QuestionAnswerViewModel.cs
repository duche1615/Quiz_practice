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
        public string? SubjectName { get; set; }
        public string? LessonName { get; set; }
        public string? TopicName { get; set; }
        public List<AnswerViewModel> Answers { get; set; }
    }
}
