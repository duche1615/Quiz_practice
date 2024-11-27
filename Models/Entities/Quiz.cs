using System.ComponentModel.DataAnnotations;

namespace Quizpractice.Models.Entities
{
    public class Quiz
    {
        public int QuizId { get; set; }
        [Required]
        [MaxLength(250)]
        public string Name { get; set; }
        public string Description { get; set; }
        public int SubjectId { get; set; }
        public string Type { get; set; }
        public string Level { get; set; }
        public int Duration { get; set; }
        public decimal PassRate { get; set; }
        public string Status { get; set; }
        public Subject Subject { get; set; }
    }
}
