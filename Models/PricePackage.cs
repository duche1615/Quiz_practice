using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class PricePackage
    {
        public PricePackage()
        {
            RegistrationSubjects = new HashSet<RegistrationSubject>();
        }

        public int PriceId { get; set; }
        public string? Name { get; set; }
        public int? AcessDuration { get; set; }
        public double? Price { get; set; }
        public double? SalePrice { get; set; }
        public bool? Status { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<RegistrationSubject> RegistrationSubjects { get; set; }
    }
}
