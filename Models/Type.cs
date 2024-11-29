using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Type
    {
        public Type()
        {
            Dimensions = new HashSet<Dimension>();
            PostFiles = new HashSet<PostFile>();
            Quizzes = new HashSet<Quiz>();
            Settings = new HashSet<Setting>();
        }

        public string TypeId { get; set; } = null!;
        public string? TypeName { get; set; }

        public virtual ICollection<Dimension> Dimensions { get; set; }
        public virtual ICollection<PostFile> PostFiles { get; set; }
        public virtual ICollection<Quiz> Quizzes { get; set; }
        public virtual ICollection<Setting> Settings { get; set; }
    }
}
