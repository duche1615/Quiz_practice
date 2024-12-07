namespace Quizpractice.ViewModels
{
    public class EditQuizViewModel
    {
        public int QuizId { get; set; }
        public string Title { get; set; }
        public string Level { get; set; }
        public string Description { get; set; }
        public int? Duration { get; set; }      
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        
    }
}
