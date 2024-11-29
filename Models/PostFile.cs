using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class PostFile
    {
        public PostFile()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }
        public string? TypeId { get; set; }
        public string? FilePost { get; set; }

        public virtual Type? Type { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
    }
}
