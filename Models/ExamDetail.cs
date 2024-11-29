using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class ExamDetail
    {
        public int ExamId { get; set; }
        public int? QuesId { get; set; }

        public virtual Exam Exam { get; set; } = null!;
        public virtual Question? Ques { get; set; }
    }
}
