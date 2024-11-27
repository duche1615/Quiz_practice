using System.ComponentModel.DataAnnotations;

namespace Quizpractice.Models.Entities
{
    public class Question
    {
        public int QuestionId { get; set; }
        [Required]
        public string Content { get; set; }
        public int SubjectId { get; set; }
        public string Level { get; set; }
        public string Status { get; set; }
        public Subject? Subject { get; set; }
        public ICollection<Answer> Answers { get; set; }
    }
}
