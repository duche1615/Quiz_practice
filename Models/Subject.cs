using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public class Subject
    {
        public Subject()
        {
            Chapters = new HashSet<Chapter>();
            Lessions = new HashSet<Lession>();
            Questions = new HashSet<Question>();
            Quizzes = new HashSet<Quiz>();
            RegistrationSubjects = new HashSet<RegistrationSubject>();
        }

        public int SubjectId { get; set; }
        public string? SubjectName { get; set; }
        public bool? Status { get; set; }
        public int? TagLine { get; set; }
        public string? Title { get; set; }
        public string? Thumbnail { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<Chapter> Chapters { get; set; }
        public virtual ICollection<Lession> Lessions { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<Quiz> Quizzes { get; set; }
        public virtual ICollection<RegistrationSubject> RegistrationSubjects { get; set; }
    }
}
