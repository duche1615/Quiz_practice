using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Subject
    {
        public Subject()
        {
            Lessons = new HashSet<Lesson>();
            Questions = new HashSet<Question>();
            Quizzes = new HashSet<Quiz>();
            RegistrationSubjects = new HashSet<RegistrationSubject>();
            Sliders = new HashSet<Slider>();
        }

        public int SubjectId { get; set; }
        public string? SubjectName { get; set; }
        public int? CategoryId { get; set; }
        public bool? Status { get; set; }
        public int? TagLine { get; set; }
        public string? Title { get; set; }
        public string? Thumbnail { get; set; }
        public string? Description { get; set; }

        public virtual Category? Category { get; set; }
        public virtual ICollection<Lesson> Lessons { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<Quiz> Quizzes { get; set; }
        public virtual ICollection<RegistrationSubject> RegistrationSubjects { get; set; }
        public virtual ICollection<Slider> Sliders { get; set; }
    }
}
