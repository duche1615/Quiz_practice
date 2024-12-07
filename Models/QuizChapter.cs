using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class QuizChapter
    {
        public int QuizChapterId { get; set; }
        public int Quizid { get; set; }
        public int Chapterid { get; set; }

        public virtual Chapter Chapter { get; set; } = null!;
        public virtual Quiz Quiz { get; set; } = null!;
    }
}
