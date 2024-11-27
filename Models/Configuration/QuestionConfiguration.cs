using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.Entities;

namespace Quizpractice.Models.Configuration
{
    public class QuestionConfiguration : IEntityTypeConfiguration<Question>
    {
        public void Configure(EntityTypeBuilder<Question> builder)
        {
            builder.ToTable("Questions");
            builder.HasKey(x => x.QuestionId);
            builder.Property(x => x.QuestionId).IsRequired().UseIdentityColumn();
            builder.Property(x => x.Content).IsRequired();
            builder.Property(x => x.Level).IsRequired();

            // Foreign Key
            builder.HasOne(x => x.Subject)
                .WithMany(x => x.Questions)
                .HasForeignKey(x => x.SubjectId)
                .IsRequired();
        }
    }
}
