using System;
using System.Collections.Generic;

namespace Quizpractice.Models
{
    public partial class User
    {
        public User()
        {
            Posts = new HashSet<Post>();
            Quizzes = new HashSet<Quiz>();
            RegistrationSubjects = new HashSet<RegistrationSubject>();
        }

        public int UserId { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public bool? Status { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Fullname { get; set; }
        public string? Address { get; set; }
        public bool? Gender { get; set; }
        public string? Avatar { get; set; }
        public int? RoleId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string? PasswordToken { get; set; }

        public virtual Role? Role { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
        public virtual ICollection<Quiz> Quizzes { get; set; }
        public virtual ICollection<RegistrationSubject> RegistrationSubjects { get; set; }
    }
}
