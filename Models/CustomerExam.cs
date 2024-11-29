using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class CustomerExam
    {
        public int CeId { get; set; }
        public int? ExamId { get; set; }
        public int? UserId { get; set; }
        public DateTime? DateTaken { get; set; }
        public TimeSpan? TimeExam { get; set; }

        public virtual Exam? Exam { get; set; }
        public virtual CustomerExamDetail? CustomerExamDetail { get; set; }
    }
}
