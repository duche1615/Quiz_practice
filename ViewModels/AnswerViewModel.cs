using System.ComponentModel.DataAnnotations;

namespace Quizpractice.ViewModels
{
    public class AnswerViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Answer is required.")]
        public string Content { get; set; }
        public bool Correct { get; set; }
        public int QuesId { get; set; }
    }
}
