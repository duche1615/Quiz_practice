using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Answer
    {
        public Answer()
        {
            AnswerDetails = new HashSet<AnswerDetail>();
        }

        public int AnswerId { get; set; }
        public string? Content { get; set; }
        public bool? Correct { get; set; }
        public int? QuesId { get; set; }

        public virtual Question? Ques { get; set; }
        public virtual ICollection<AnswerDetail> AnswerDetails { get; set; }
    }
}
