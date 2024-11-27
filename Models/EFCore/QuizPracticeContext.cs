using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.Configuration;
using Quizpractice.Models.Entities;

namespace Quizpractice.Models.EFCore
{
    public class QuizPracticeContext : DbContext
    {
        public QuizPracticeContext(DbContextOptions<QuizPracticeContext> options)
        : base(options) 
        {
        }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Subject> Subjects { get; set; }
        public DbSet<Quiz> Quizzes { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Answer> Answers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new SubjectConfiguration());
            modelBuilder.ApplyConfiguration(new QuizConfiguration());
            modelBuilder.ApplyConfiguration(new QuestionConfiguration());
            modelBuilder.ApplyConfiguration(new AnswerConfiguration());
        }
    }
}
