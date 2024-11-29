using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class CustomerExamDetail
    {
        public int CeId { get; set; }
        public int? QuestionId { get; set; }
        public int? AnswerId { get; set; }
        public int? Truth { get; set; }

        public virtual CustomerExam Ce { get; set; } = null!;
        public virtual Question? Question { get; set; }
    }
}
