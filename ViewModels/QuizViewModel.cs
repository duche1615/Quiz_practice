namespace Quizpractice.ViewModels
{
    public class QuizViewModel
    {
        public int QuizId { get; set; }
        public string? Title { get; set; }
        public string? Level { get; set; }
        public string? Description { get; set; }
        public int Duration { get; set; }
        public string? Status { get; set; }
        public int? TotalQues { get; set; }
    }
}
