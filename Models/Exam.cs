using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Exam
    {
        public Exam()
        {
            CustomerExams = new HashSet<CustomerExam>();
        }

        public int ExamId { get; set; }
        public bool? IsFree { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public string? Title { get; set; }
        public int? SubId { get; set; }
        public int? CategoryId { get; set; }
        public string? Level { get; set; }
        public double? PassRate { get; set; }
        public int? UserId { get; set; }
        public int? Number { get; set; }
        public string? Content { get; set; }
        public string? ExamTypeId { get; set; }

        public virtual Category? Category { get; set; }
        public virtual ExamType? ExamType { get; set; }
        public virtual User? User { get; set; }
        public virtual ExamDetail? ExamDetail { get; set; }
        public virtual ICollection<CustomerExam> CustomerExams { get; set; }
    }
}
