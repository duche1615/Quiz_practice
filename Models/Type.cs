using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Type
    {
        public Type()
        {
            PostFiles = new HashSet<PostFile>();
        }

        public string TypeId { get; set; } = null!;
        public string? TypeName { get; set; }

        public virtual ICollection<PostFile> PostFiles { get; set; }
    }
}
