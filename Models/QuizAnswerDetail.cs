using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class QuizAnswerDetail
    {
        public int Id { get; set; }
        public int QuizDetailId { get; set; }
        public int QuestionId { get; set; }
        public int SelectedAnswerId { get; set; }
        public int TrueAnswerId { get; set; }
        public bool IsCorrect { get; set; }

        public virtual QuizDetail QuizDetail { get; set; } = null!;
    }
}
