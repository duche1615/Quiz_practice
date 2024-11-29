using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class ExamType
    {
        public ExamType()
        {
            Exams = new HashSet<Exam>();
        }

        public string ExamTypeId { get; set; } = null!;
        public string? ExamTypeName { get; set; }

        public virtual ICollection<Exam> Exams { get; set; }
    }
}
