using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Quizpractice.Models
{
    public partial class Answer
    {
        public int AnswerId { get; set; }
        public string? Content { get; set; }
        public bool Correct { get; set; }
        public int? QuesId { get; set; }
        [JsonIgnore]
        public virtual Question? Ques { get; set; }
    }
}
