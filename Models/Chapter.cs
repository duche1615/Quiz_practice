using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Chapter
    {
        public Chapter()
        {
            Lesstions = new HashSet<Lesstion>();
            Questions = new HashSet<Question>();
        }

        public int ChapterId { get; set; }
        public string? ChapterName { get; set; }
        public string? Content { get; set; }
        public bool? Active { get; set; }
        public bool? Public { get; set; }
        public int? SubId { get; set; }
        public string? Description { get; set; }

        public virtual Subject? Sub { get; set; }
        public virtual ICollection<Lesstion> Lesstions { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
    }
}
