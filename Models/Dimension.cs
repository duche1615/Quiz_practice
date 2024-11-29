using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Dimension
    {
        public int DimId { get; set; }
        public string? TypeId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }

        public virtual Type? Type { get; set; }
    }
}
