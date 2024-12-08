using Quizpractice.Models;

namespace Quizpractice.ViewModels
{
    public class CreateQuizViewModel
    {
        public int QuizId { get; set; }
        public string Title { get; set; }
        public string Level { get; set; }
        public string Description { get; set; }
        public int Duration { get; set; }
        public int? SubjectId { get; set; }
        public int? ChapterId { get; set; } 
        public int TotalQuestions { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }       
        public IEnumerable<Subject> Subjects { get; set; }
        public IEnumerable<Chapter> Chapters { get; set; }
    }
}
