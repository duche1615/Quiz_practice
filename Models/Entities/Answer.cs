namespace Quizpractice.Models.Entities
{
    public class Answer
    {
        public int AnswerId { get; set; }
        public int QuestionId { get; set; }
        public string Content { get; set; }
        public bool IsCorrect { get; set; }

        public Question Questions { get; set; }
    }
}
