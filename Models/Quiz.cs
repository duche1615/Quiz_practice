using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Quiz
    {
        public Quiz()
        {
            AnswerDetails = new HashSet<AnswerDetail>();
            Questions = new HashSet<Question>();
        }

        public int QuizId { get; set; }
        public string? Title { get; set; }
        public string? Level { get; set; }
        public string? ImgUrl { get; set; }
        public TimeSpan? StartTime { get; set; }
        public TimeSpan? EndTime { get; set; }
        public bool? Status { get; set; }
        public double? Rate { get; set; }
        public bool? HasJoin { get; set; }
        public int? SubId { get; set; }
        public int? UserId { get; set; }
        public int? QuesId { get; set; }
        public int? LessonId { get; set; }
        public int? Duration { get; set; }
        public string? TypeId { get; set; }
        public string? Description { get; set; }
        public int? TotalQues { get; set; }
        public int? Attempt { get; set; }

        public virtual Lesson? Lesson { get; set; }
        public virtual Subject? Sub { get; set; }
        public virtual Type? Type { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<AnswerDetail> AnswerDetails { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
    }
}
