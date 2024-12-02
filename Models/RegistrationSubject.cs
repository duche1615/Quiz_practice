using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class RegistrationSubject
    {
        public int RegisId { get; set; }
        public DateTime? RegisDate { get; set; }
        public bool? Status { get; set; }
        public int? SubId { get; set; }
        public int? PriceId { get; set; }
        public int? UserId { get; set; }

        public virtual PricePackage? Price { get; set; }
        public virtual Subject? Sub { get; set; }
        public virtual User? User { get; set; }
    }
}
