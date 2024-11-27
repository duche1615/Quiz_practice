using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Quizpractice.Models.Entities;

namespace Quizpractice.Models.Configuration
{
    public class SubjectConfiguration : IEntityTypeConfiguration<Subject>
    {
        public void Configure(EntityTypeBuilder<Subject> builder)
        {
            builder.ToTable("Subjects");
            builder.HasKey(x => x.SubjectId);
            builder.Property(x => x.SubjectId).IsRequired().UseIdentityColumn();
            builder.Property(x => x.Name).IsRequired().HasMaxLength(255);
            builder.Property(x => x.Description).HasColumnType("TEXT");

            // Define the foreign key relationship
            builder.HasOne(x => x.Category)         // A Subject has one Category
                .WithMany(x => x.Subjects)          // A Category has many Subjects
                .HasForeignKey(x => x.CategoryId)   // Foreign key property in Subject
                .IsRequired();
        }
    }
}
