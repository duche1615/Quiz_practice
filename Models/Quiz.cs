using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Quiz
    {
        public Quiz()
        {
            QuestionQuizzes = new HashSet<QuestionQuiz>();
            QuizChapters = new HashSet<QuizChapter>();
            QuizDetails = new HashSet<QuizDetail>();
        }

        public int QuizId { get; set; }
        public string? Title { get; set; }
        public string? Level { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public bool? Public { get; set; }
        public bool? Active { get; set; }
        public double? PassPercent { get; set; }
        public int? SubId { get; set; }
        public int? UserCreateId { get; set; }
        public int? QuesId { get; set; }
        public int? Duration { get; set; }
        public string? Description { get; set; }
        public int? TotalQues { get; set; }
        public int Attempt { get; set; }

        public virtual Subject? Sub { get; set; }
        public virtual User? UserCreate { get; set; }
        public virtual ICollection<QuestionQuiz> QuestionQuizzes { get; set; }
        public virtual ICollection<QuizChapter> QuizChapters { get; set; }
        public virtual ICollection<QuizDetail> QuizDetails { get; set; }

        public string? SubjectName => Sub?.SubjectName;
    }
}
