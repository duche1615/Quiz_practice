using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Question
    {
        public Question()
        {
            AnswerDetails = new HashSet<AnswerDetail>();
            Answers = new HashSet<Answer>();
            CustomerExamDetails = new HashSet<CustomerExamDetail>();
            ExamDetails = new HashSet<ExamDetail>();
        }

        public int QuestionId { get; set; }
        public string? Content { get; set; }
        public int? SubjectId { get; set; }
        public int? LessonId { get; set; }
        public int? TopicId { get; set; }
        public string? Level { get; set; }
        public bool? Status { get; set; }
        public int? QuizId { get; set; }
        public int? DimmensionId { get; set; }
        public bool? IsMultipleChoice { get; set; }

        public virtual Lesson? Lesson { get; set; }
        public virtual Subject? Subject { get; set; }
        public virtual Topic? Topic { get; set; }
        public virtual ICollection<AnswerDetail> AnswerDetails { get; set; }
        public virtual ICollection<Answer> Answers { get; set; }
        public virtual ICollection<CustomerExamDetail> CustomerExamDetails { get; set; }
        public virtual ICollection<ExamDetail> ExamDetails { get; set; }
    }
}
