using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Blog
    {
        public Blog()
        {
            Posts = new HashSet<Post>();
        }

        public int BlogId { get; set; }
        public string? BlogName { get; set; }
        public DateTime? BlogDate { get; set; }
        public string? BlogDetail { get; set; }
        public string? Img { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
