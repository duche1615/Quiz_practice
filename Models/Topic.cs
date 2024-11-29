using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Topic
    {
        public Topic()
        {
            Questions = new HashSet<Question>();
        }

        public int TopicId { get; set; }
        public string? Name { get; set; }
        public bool? Status { get; set; }
        public int? SubId { get; set; }

        public virtual ICollection<Question> Questions { get; set; }
    }
}
