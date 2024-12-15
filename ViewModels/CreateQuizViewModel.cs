using Quizpractice.Models;
using System.ComponentModel.DataAnnotations;

namespace Quizpractice.ViewModels
{
    public class CreateQuizViewModel
    {
        
        public int? QuizId { get; set; }
        [Required(ErrorMessage = "Title is required.")]
        [StringLength(100, ErrorMessage = "Title cannot exceed 100 characters.")]
        public string Title { get; set; }
        public string Level { get; set; }
        [Required(ErrorMessage = "Description is required.")]
        [StringLength(500, ErrorMessage = "Description cannot exceed 500 characters.")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Duration is required.")]
        [Range(5, 300, ErrorMessage = "Duration must be between 5 and 300 minutes.")]
        public int Duration { get; set; }
        [Required(ErrorMessage = "Subject is required.")]
        public int? SubjectId { get; set; }
        public int? ChapterId { get; set; }
        [Required(ErrorMessage = "Total Questions is required.")]
        [Range(1, 100, ErrorMessage = "Total Questions must be between 1 and 100.")]
        public int TotalQuestions { get; set; }
        [Required(ErrorMessage = "Start Time is required.")]
        
        public DateTime StartTime { get; set; }
        [Required(ErrorMessage = "End Time is required.")]
        
        public DateTime EndTime { get; set; }

    }
}
