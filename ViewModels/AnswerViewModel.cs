namespace Quizpractice.ViewModels
{
    public class AnswerViewModel
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public bool Correct { get; set; }
        public int QuesId { get; set; }
    }
}
