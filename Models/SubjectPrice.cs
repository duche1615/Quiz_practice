using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class SubjectPrice
    {
        public int? PriceId { get; set; }
        public int? SubjectId { get; set; }

        public virtual PricePackage? Price { get; set; }
        public virtual Subject? Subject { get; set; }
    }
}
