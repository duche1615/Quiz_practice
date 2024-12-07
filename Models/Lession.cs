using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Lession
    {
        public int LessionId { get; set; }
        public string? LessionUrl { get; set; }
        public bool? Status { get; set; }
        public string? Title { get; set; }
        public string Content { get; set; } = null!;
        public string? Backlink { get; set; }
        public string? Notes { get; set; }
        public bool? Public { get; set; }
        public int? Subid { get; set; }
        public int? Chapterid { get; set; }

        public virtual Chapter? Chapter { get; set; }
        public virtual Subject? Sub { get; set; }
    }
}
