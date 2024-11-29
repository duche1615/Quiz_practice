using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Post
    {
        public int PostId { get; set; }
        public string? Thumbnail { get; set; }
        public int? UserId { get; set; }
        public int? CategoryBlogId { get; set; }
        public string? Content { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? EditDate { get; set; }
        public bool? Status { get; set; }
        public string? BrifInfor { get; set; }
        public string? Title { get; set; }
        public int? PostFileId { get; set; }

        public virtual Blog? CategoryBlog { get; set; }
        public virtual PostFile? PostFile { get; set; }
        public virtual User? User { get; set; }
    }
}
