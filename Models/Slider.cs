using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Slider
    {
        public int SliderId { get; set; }
        public string? SliderUrl { get; set; }
        public bool? Status { get; set; }
        public string? Title { get; set; }
        public string? Content { get; set; }
        public string? Backlink { get; set; }
        public string? Notes { get; set; }
        public bool? IsShow { get; set; }
        public int? SubId { get; set; }

        public virtual Subject? Sub { get; set; }
    }
}
