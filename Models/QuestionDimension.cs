using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class QuestionDimension
    {
        public int? DimId { get; set; }
        public int? QuestionId { get; set; }

        public virtual Dimension? Dim { get; set; }
        public virtual Question? Question { get; set; }
    }
}
