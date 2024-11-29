using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class Setting
    {
        public int SettingId { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Value { get; set; }
        public string? TypeId { get; set; }
        public bool? Status { get; set; }

        public virtual Type? Type { get; set; }
    }
}
