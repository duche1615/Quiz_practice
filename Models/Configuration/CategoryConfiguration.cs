using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models.Entities;

namespace Quizpractice.Models.Configuration
{
    public class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.ToTable("Categories"); // Tên bảng
            builder.HasKey(x => x.CategoryId); // Định nghĩa Primary Key

            builder.Property(x => x.Name)
                .IsRequired()
                .HasMaxLength(100);

            builder.Property(x => x.Description)
                .HasMaxLength(500);

            // Một Category có nhiều Subjects
            builder.HasMany(x => x.Subjects)
                .WithOne(x => x.Category)
                .HasForeignKey(x => x.SubjectId)
                .IsRequired();
        }
    }
}
