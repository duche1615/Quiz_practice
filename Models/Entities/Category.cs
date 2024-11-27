using System.ComponentModel.DataAnnotations;

namespace Quizpractice.Models.Entities
{
    public class Category
    {
        public int CategoryId { get; set; }
        [Required]
        [MaxLength(250)]
        public string Name { get; set; }
        public string Description { get; set; }
        public ICollection<Subject>? Subjects { get; set; }
    }
}
