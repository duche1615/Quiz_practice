using System.ComponentModel.DataAnnotations;

namespace Quizpractice.Models.Entities
{
    public class Subject
    {
        public int SubjectId { get; set; }
        [Required]
        [MaxLength(250)]
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime UpdatedDate { get; set; } = DateTime.Now;
        public int CategoryId { get; set; }
        public Category? Category { get; set; }
        public ICollection<Quiz> Quizzes { get; set; }
        public ICollection<Question> Questions { get; set; }

    }
}
