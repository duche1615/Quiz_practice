using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.Entities;

namespace Quizpractice.Models.Configuration
{
    public class AnswerConfiguration : IEntityTypeConfiguration<Answer>
    {
        public void Configure(EntityTypeBuilder<Answer> builder)
        {
            builder.ToTable("Answers");
            builder.HasKey(x => x.AnswerId);
            builder.Property(x => x.AnswerId).IsRequired().UseIdentityColumn();
            builder.Property(x => x.Content).IsRequired();
            builder.Property(x => x.IsCorrect).IsRequired();

            // Foreign Key
            builder.HasOne(x => x.Questions)
                .WithMany(x => x.Answers)
                .HasForeignKey(x => x.QuestionId)
                .IsRequired();
        }
    }
}
