using System.ComponentModel.DataAnnotations;

namespace Quizpractice.ViewModels
{
    public class EditQuizViewModel
    {
        public int QuizId { get; set; }
        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, ErrorMessage = "Title cannot exceed 100 characters.")]
        public string Title { get; set; }
        public string Level { get; set; }
        [Required(ErrorMessage = "Description is required.")]
        [StringLength(500, ErrorMessage = "Description cannot exceed 500 characters.")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Duration is required.")]
        [Range(5, 300, ErrorMessage = "Duration must be between 5 and 300 minutes.")]
        public int? Duration { get; set; }      
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        
    }
}
