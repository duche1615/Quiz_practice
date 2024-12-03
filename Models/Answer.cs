using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Answer
    {
        public int AnswerId { get; set; }
        public string? Content { get; set; }
        public bool? Correct { get; set; }
        public int? QuesId { get; set; }

        public virtual Question? Ques { get; set; }
    }
}
