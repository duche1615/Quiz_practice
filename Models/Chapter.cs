using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Chapter
    {
        public Chapter()
        {
            Lessions = new HashSet<Lession>();
            Questions = new HashSet<Question>();
            QuizChapters = new HashSet<QuizChapter>();
        }

        public int ChapterId { get; set; }
        public string? ChapterName { get; set; }
        public string? Content { get; set; }
        public bool? Active { get; set; }
        public bool? Public { get; set; }
        public int? SubId { get; set; }
        public string? Description { get; set; }

        public virtual Subject? Sub { get; set; }
        public virtual ICollection<Lession> Lessions { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<QuizChapter> QuizChapters { get; set; }
    }
}
