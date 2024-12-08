using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Quizpractice.Models
{
    public partial class SWP391_DBContext : DbContext
    {
        public SWP391_DBContext()
        {
        }

        public SWP391_DBContext(DbContextOptions<SWP391_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Answer> Answers { get; set; } = null!;
        public virtual DbSet<Blog> Blogs { get; set; } = null!;
        public virtual DbSet<Chapter> Chapters { get; set; } = null!;
        public virtual DbSet<Lession> Lessions { get; set; } = null!;
        public virtual DbSet<Post> Posts { get; set; } = null!;
        public virtual DbSet<PostFile> PostFiles { get; set; } = null!;
        public virtual DbSet<PricePackage> PricePackages { get; set; } = null!;
        public virtual DbSet<Question> Questions { get; set; } = null!;
        public virtual DbSet<QuestionQuiz> QuestionQuizzes { get; set; } = null!;
        public virtual DbSet<Quiz> Quizzes { get; set; } = null!;
        public virtual DbSet<QuizAnswerDetail> QuizAnswerDetails { get; set; } = null!;
        public virtual DbSet<QuizChapter> QuizChapters { get; set; } = null!;
        public virtual DbSet<QuizDetail> QuizDetails { get; set; } = null!;
        public virtual DbSet<RegistrationSubject> RegistrationSubjects { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Subject> Subjects { get; set; } = null!;
        public virtual DbSet<SubjectPrice> SubjectPrices { get; set; } = null!;
        public virtual DbSet<Type> Types { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                Console.WriteLine(Directory.GetCurrentDirectory());
                IConfiguration config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", true, true)
                .Build();
                var strConn = config["ConnectionStrings:MyDatabase"];
                optionsBuilder.UseSqlServer(strConn);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Answer>(entity =>
            {
                entity.ToTable("Answer");

                entity.Property(e => e.AnswerId).HasColumnName("answerId");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("content");

                entity.Property(e => e.Correct).HasColumnName("correct");

                entity.Property(e => e.QuesId).HasColumnName("quesId");

                entity.HasOne(d => d.Ques)
                    .WithMany(p => p.Answers)
                    .HasForeignKey(d => d.QuesId)
                    .HasConstraintName("FK_Answer_Question");
            });

            modelBuilder.Entity<Blog>(entity =>
            {
                entity.ToTable("Blog");

                entity.Property(e => e.BlogId).HasColumnName("blogId");

                entity.Property(e => e.BlogDate)
                    .HasColumnType("date")
                    .HasColumnName("blogDate");

                entity.Property(e => e.BlogDetail).HasColumnName("blogDetail");

                entity.Property(e => e.BlogName)
                    .HasMaxLength(255)
                    .HasColumnName("blogName");

                entity.Property(e => e.Img)
                    .HasMaxLength(250)
                    .HasColumnName("img");
            });

            modelBuilder.Entity<Chapter>(entity =>
            {
                entity.ToTable("Chapter");

                entity.Property(e => e.ChapterId).HasColumnName("chapterId");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.ChapterName)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("chapterName");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("content");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.Public).HasColumnName("public");

                entity.Property(e => e.SubId).HasColumnName("subId");

                entity.HasOne(d => d.Sub)
                    .WithMany(p => p.Chapters)
                    .HasForeignKey(d => d.SubId)
                    .HasConstraintName("FK_Lesson_Subject");
            });

            modelBuilder.Entity<Lession>(entity =>
            {
                entity.ToTable("Lession");

                entity.Property(e => e.LessionId).HasColumnName("lessionId");

                entity.Property(e => e.Backlink)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("backlink");

                entity.Property(e => e.Chapterid).HasColumnName("chapterid");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("content");

                entity.Property(e => e.LessionUrl)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("lessionURL");

                entity.Property(e => e.Notes)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("notes");

                entity.Property(e => e.Public).HasColumnName("public");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Subid).HasColumnName("subid");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.HasOne(d => d.Chapter)
                    .WithMany(p => p.Lessions)
                    .HasForeignKey(d => d.Chapterid)
                    .HasConstraintName("FK_Lesstion_Chapter");

                entity.HasOne(d => d.Sub)
                    .WithMany(p => p.Lessions)
                    .HasForeignKey(d => d.Subid)
                    .HasConstraintName("FK_Lesstion_Subject");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.ToTable("Post");

                entity.Property(e => e.PostId).HasColumnName("postId");

                entity.Property(e => e.BrifInfor)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("brifInfor");

                entity.Property(e => e.CategoryBlogId).HasColumnName("categoryBlogId");

                entity.Property(e => e.Content)
                    .IsUnicode(false)
                    .HasColumnName("content");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("created_date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.EditDate)
                    .HasColumnType("date")
                    .HasColumnName("edit_date");

                entity.Property(e => e.PostFileId).HasColumnName("postFileId");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Thumbnail)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("thumbnail");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.HasOne(d => d.CategoryBlog)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.CategoryBlogId)
                    .HasConstraintName("FK_Post_Blog");

                entity.HasOne(d => d.PostFile)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.PostFileId)
                    .HasConstraintName("FK_Post_Post_File");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Post_User");
            });

            modelBuilder.Entity<PostFile>(entity =>
            {
                entity.ToTable("Post_File");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FilePost)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("filePost");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.TypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("typeId");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.PostFiles)
                    .HasForeignKey(d => d.TypeId)
                    .HasConstraintName("FK_Post_File_Type");
            });

            modelBuilder.Entity<PricePackage>(entity =>
            {
                entity.HasKey(e => e.PriceId);

                entity.ToTable("PricePackage");

                entity.Property(e => e.PriceId).HasColumnName("priceId");

                entity.Property(e => e.AcessDuration).HasColumnName("acessDuration");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .HasColumnName("description");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<Question>(entity =>
            {
                entity.ToTable("Question");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                entity.Property(e => e.ChapterId).HasColumnName("chapterId");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .HasColumnName("content");

                entity.Property(e => e.IsMultipleChoice).HasColumnName("isMultipleChoice");

                entity.Property(e => e.Level)
                    .HasMaxLength(255)
                    .HasColumnName("level");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubjectId).HasColumnName("subjectId");

                entity.HasOne(d => d.Chapter)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.ChapterId)
                    .HasConstraintName("FK_Question_Lesson");

                entity.HasOne(d => d.Subject)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.SubjectId)
                    .HasConstraintName("FK_Question_Subject");
            });

            modelBuilder.Entity<QuestionQuiz>(entity =>
            {
                entity.HasKey(e => e.QuizQuestionId);

                entity.ToTable("Question_Quiz");

                entity.Property(e => e.QuizQuestionId).HasColumnName("quiz_question_id");

                entity.Property(e => e.QuesId).HasColumnName("quesId");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.HasOne(d => d.Ques)
                    .WithMany(p => p.QuestionQuizzes)
                    .HasForeignKey(d => d.QuesId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Question_Quiz_Question");

                entity.HasOne(d => d.Quiz)
                    .WithMany(p => p.QuestionQuizzes)
                    .HasForeignKey(d => d.QuizId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Question_Quiz_Quiz");
            });

            modelBuilder.Entity<Quiz>(entity =>
            {
                entity.ToTable("Quiz");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.Attempt).HasColumnName("attempt");

                entity.Property(e => e.Description)
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.Duration).HasColumnName("duration");

                entity.Property(e => e.EndTime)
                    .HasColumnType("datetime")
                    .HasColumnName("end_time");

                entity.Property(e => e.Level)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("level");

                entity.Property(e => e.PassPercent).HasColumnName("pass_percent");

                entity.Property(e => e.Public).HasColumnName("public");

                entity.Property(e => e.QuesId).HasColumnName("quesId");

                entity.Property(e => e.StartTime)
                    .HasColumnType("datetime")
                    .HasColumnName("start_time");

                entity.Property(e => e.SubId).HasColumnName("subId");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.Property(e => e.TotalQues).HasColumnName("totalQues");

                entity.Property(e => e.UserCreateId).HasColumnName("user_create_id");

                entity.HasOne(d => d.Sub)
                    .WithMany(p => p.Quizzes)
                    .HasForeignKey(d => d.SubId)
                    .HasConstraintName("FK_Quiz_Subject");

                entity.HasOne(d => d.UserCreate)
                    .WithMany(p => p.Quizzes)
                    .HasForeignKey(d => d.UserCreateId)
                    .HasConstraintName("FK_Quiz_User");
            });

            modelBuilder.Entity<QuizAnswerDetail>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Quiz_Answer_Detail");

                entity.Property(e => e.IsCorrect).HasColumnName("isCorrect");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                entity.Property(e => e.QuizDetailId).HasColumnName("quiz_detail_id");

                entity.Property(e => e.SelectedAnswerId).HasColumnName("selected_answer_id");

                entity.Property(e => e.TrueAnswerId).HasColumnName("true_answer_id");

                entity.HasOne(d => d.QuizDetail)
                    .WithMany()
                    .HasForeignKey(d => d.QuizDetailId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Quiz_Question_Detail_Quiz_Detail");
            });

            modelBuilder.Entity<QuizChapter>(entity =>
            {
                entity.ToTable("Quiz_Chapter");

                entity.Property(e => e.QuizChapterId).HasColumnName("quiz_chapter_id");

                entity.Property(e => e.Chapterid).HasColumnName("chapterid");

                entity.Property(e => e.Quizid).HasColumnName("quizid");

                entity.HasOne(d => d.Chapter)
                    .WithMany(p => p.QuizChapters)
                    .HasForeignKey(d => d.Chapterid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Quiz_Chapter_Chapter");

                entity.HasOne(d => d.Quiz)
                    .WithMany(p => p.QuizChapters)
                    .HasForeignKey(d => d.Quizid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Quiz_Chapter_Quiz");
            });

            modelBuilder.Entity<QuizDetail>(entity =>
            {
                entity.ToTable("Quiz_Detail");

                entity.Property(e => e.QuizDetailId).HasColumnName("quiz_detail_id");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.Property(e => e.Score).HasColumnName("score");

                entity.Property(e => e.TakenDate)
                    .HasColumnType("datetime")
                    .HasColumnName("taken_date");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.HasOne(d => d.Quiz)
                    .WithMany(p => p.QuizDetails)
                    .HasForeignKey(d => d.QuizId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Quiz_Detail_Quiz");
            });

            modelBuilder.Entity<RegistrationSubject>(entity =>
            {
                entity.HasKey(e => e.RegisId)
                    .HasName("PK__Registra__61789DEF44A52D08");

                entity.ToTable("Registration_Subject");

                entity.Property(e => e.RegisId).HasColumnName("regisId");

                entity.Property(e => e.PriceId).HasColumnName("priceId");

                entity.Property(e => e.RegisDate)
                    .HasColumnType("date")
                    .HasColumnName("regis_Date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubId).HasColumnName("subId");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.HasOne(d => d.Price)
                    .WithMany(p => p.RegistrationSubjects)
                    .HasForeignKey(d => d.PriceId)
                    .HasConstraintName("FK_Registration_Subject_PricePackage");

                entity.HasOne(d => d.Sub)
                    .WithMany(p => p.RegistrationSubjects)
                    .HasForeignKey(d => d.SubId)
                    .HasConstraintName("FK_Registration_Subject_Subject");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.RegistrationSubjects)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Registration_Subject_User");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleId).HasColumnName("roleId");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(255)
                    .HasColumnName("roleName");
            });

            modelBuilder.Entity<Subject>(entity =>
            {
                entity.ToTable("Subject");

                entity.Property(e => e.SubjectId).HasColumnName("subjectId");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .HasColumnName("description");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubjectName)
                    .HasMaxLength(255)
                    .HasColumnName("subjectName");

                entity.Property(e => e.TagLine).HasColumnName("tagLine");

                entity.Property(e => e.Thumbnail)
                    .HasMaxLength(255)
                    .HasColumnName("thumbnail");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .HasColumnName("title");
            });

            modelBuilder.Entity<SubjectPrice>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("SubjectPrice");

                entity.Property(e => e.PriceId).HasColumnName("priceId");

                entity.Property(e => e.SubjectId).HasColumnName("subjectId");

                entity.HasOne(d => d.Price)
                    .WithMany()
                    .HasForeignKey(d => d.PriceId)
                    .HasConstraintName("FK_SubjectPrice_PricePackage");

                entity.HasOne(d => d.Subject)
                    .WithMany()
                    .HasForeignKey(d => d.SubjectId)
                    .HasConstraintName("FK_SubjectPrice_Subject");
            });

            modelBuilder.Entity<Type>(entity =>
            {
                entity.ToTable("Type");

                entity.Property(e => e.TypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("typeId");

                entity.Property(e => e.TypeName)
                    .HasMaxLength(255)
                    .HasColumnName("typeName");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.Property(e => e.Address)
                    .HasMaxLength(100)
                    .HasColumnName("address");

                entity.Property(e => e.Avatar).HasColumnName("avatar");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("created_date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .HasColumnName("email");

                entity.Property(e => e.Fullname)
                    .HasMaxLength(100)
                    .HasColumnName("fullname");

                entity.Property(e => e.Gender).HasColumnName("gender");

                entity.Property(e => e.ModifyDate)
                    .HasColumnType("datetime")
                    .HasColumnName("modify_date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Password)
                    .HasMaxLength(150)
                    .HasColumnName("password");

                entity.Property(e => e.PasswordToken)
                    .HasMaxLength(45)
                    .HasColumnName("password_token");

                entity.Property(e => e.Phone)
                    .HasMaxLength(100)
                    .HasColumnName("phone");

                entity.Property(e => e.RoleId).HasColumnName("roleId");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Username)
                    .HasMaxLength(255)
                    .HasColumnName("username");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_User_Role");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
