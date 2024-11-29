using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Lesson
    {
        public Lesson()
        {
            Questions = new HashSet<Question>();
            Quizzes = new HashSet<Quiz>();
        }

        public int LessonId { get; set; }
        public string? LessonName { get; set; }
        public string? TypeId { get; set; }
        public int? Order { get; set; }
        public string? VideoUrl { get; set; }
        public string? Content { get; set; }
        public int? TopicId { get; set; }
        public bool? Status { get; set; }
        public int? SubId { get; set; }
        public string? Description { get; set; }

        public virtual Subject? Sub { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<Quiz> Quizzes { get; set; }
    }
}
