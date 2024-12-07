using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Question
    {
        public Question()
        {
            Answers = new HashSet<Answer>();
            QuestionQuizzes = new HashSet<QuestionQuiz>();
        }

        public int QuestionId { get; set; }
        public string? Content { get; set; }
        public int? SubjectId { get; set; }
        public int? ChapterId { get; set; }
        public string? Level { get; set; }
        public bool? Status { get; set; }
        public bool? IsMultipleChoice { get; set; }

        public virtual Chapter? Chapter { get; set; }
        public virtual Subject? Subject { get; set; }
        public virtual ICollection<Answer> Answers { get; set; }
        public virtual ICollection<QuestionQuiz> QuestionQuizzes { get; set; }
    }
}
