using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class QuizPoint
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public double? Point { get; set; }
        public int? QuizId { get; set; }
        public DateTime? TakenDate { get; set; }
        public double? PointPercent { get; set; }
        public double? NumQuesTrue { get; set; }
        public int? Attempt { get; set; }
    }
}
