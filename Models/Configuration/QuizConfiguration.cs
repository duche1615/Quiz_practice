using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.Entities;

namespace Quizpractice.Models.Configuration
{
    public class QuizConfiguration : IEntityTypeConfiguration<Quiz>
    {
        public void Configure(EntityTypeBuilder<Quiz> builder)
        {
            builder.ToTable("Quizzes");
            builder.HasKey(x => x.QuizId);
            builder.Property(x => x.QuizId).IsRequired().UseIdentityColumn();
            builder.Property(x => x.Name).IsRequired().HasMaxLength(255);
            builder.Property(x => x.Level).IsRequired();
            builder.Property(x => x.Duration).IsRequired();
            builder.Property(x => x.PassRate).HasColumnType("DECIMAL(5, 2)");

            // Foreign Key
            builder.HasOne(x => x.Subject)
                .WithMany(x => x.Quizzes)
                .HasForeignKey(x => x.SubjectId)
                .IsRequired();
        }
    }
}
