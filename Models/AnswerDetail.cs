using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class AnswerDetail
    {
        public int Id { get; set; }
        public int? QuestionId { get; set; }
        public int? AnswerId { get; set; }
        public int? UserId { get; set; }
        public int? QuizId { get; set; }
        public int? Attempt { get; set; }

        public virtual Answer? Answer { get; set; }
        public virtual Question? Question { get; set; }
        public virtual Quiz? Quiz { get; set; }
        public virtual User? User { get; set; }
    }
}
