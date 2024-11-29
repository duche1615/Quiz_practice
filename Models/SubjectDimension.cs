using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class SubjectDimension
    {
        public int SubjectId { get; set; }
        public int DimId { get; set; }

        public virtual Dimension Dim { get; set; } = null!;
        public virtual Subject Subject { get; set; } = null!;
    }
}
