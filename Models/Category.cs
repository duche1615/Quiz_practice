using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Category
    {
        public Category()
        {
            Exams = new HashSet<Exam>();
            Subjects = new HashSet<Subject>();
        }

        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public string? Value { get; set; }

        public virtual ICollection<Exam> Exams { get; set; }
        public virtual ICollection<Subject> Subjects { get; set; }
    }
}
