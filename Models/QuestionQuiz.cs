using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class QuestionQuiz
    {
        public int QuesId { get; set; }
        public int QuizId { get; set; }

        public virtual Question Ques { get; set; } = null!;
        public virtual Quiz Quiz { get; set; } = null!;
    }
}
