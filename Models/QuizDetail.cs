using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class QuizDetail
    {
        public int QuizDetailId { get; set; }
        public int QuizId { get; set; }
        public int UserId { get; set; }
        public DateTime TakenDate { get; set; }
        public double Score { get; set; }

        public virtual Quiz Quiz { get; set; } = null!;
    }
}
