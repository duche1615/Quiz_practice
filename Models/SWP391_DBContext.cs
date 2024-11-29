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
        public virtual DbSet<AnswerDetail> AnswerDetails { get; set; } = null!;
        public virtual DbSet<Blog> Blogs { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<CustomerExam> CustomerExams { get; set; } = null!;
        public virtual DbSet<CustomerExamDetail> CustomerExamDetails { get; set; } = null!;
        public virtual DbSet<Dimension> Dimensions { get; set; } = null!;
        public virtual DbSet<Exam> Exams { get; set; } = null!;
        public virtual DbSet<ExamDetail> ExamDetails { get; set; } = null!;
        public virtual DbSet<ExamType> ExamTypes { get; set; } = null!;
        public virtual DbSet<Lesson> Lessons { get; set; } = null!;
        public virtual DbSet<Post> Posts { get; set; } = null!;
        public virtual DbSet<PostFile> PostFiles { get; set; } = null!;
        public virtual DbSet<PricePackage> PricePackages { get; set; } = null!;
        public virtual DbSet<Question> Questions { get; set; } = null!;
        public virtual DbSet<QuestionDimension> QuestionDimensions { get; set; } = null!;
        public virtual DbSet<QuestionQuiz> QuestionQuizzes { get; set; } = null!;
        public virtual DbSet<Quiz> Quizzes { get; set; } = null!;
        public virtual DbSet<QuizPoint> QuizPoints { get; set; } = null!;
        public virtual DbSet<RegistrationSubject> RegistrationSubjects { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Setting> Settings { get; set; } = null!;
        public virtual DbSet<Slider> Sliders { get; set; } = null!;
        public virtual DbSet<Subject> Subjects { get; set; } = null!;
        public virtual DbSet<SubjectDimension> SubjectDimensions { get; set; } = null!;
        public virtual DbSet<SubjectPrice> SubjectPrices { get; set; } = null!;
        public virtual DbSet<Topic> Topics { get; set; } = null!;
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

            modelBuilder.Entity<AnswerDetail>(entity =>
            {
                entity.ToTable("answerDetail");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AnswerId).HasColumnName("answerId");

                entity.Property(e => e.Attempt).HasColumnName("attempt");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.HasOne(d => d.Answer)
                    .WithMany(p => p.AnswerDetails)
                    .HasForeignKey(d => d.AnswerId)
                    .HasConstraintName("FK__answerDet__answe__6EF57B66");

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.AnswerDetails)
                    .HasForeignKey(d => d.QuestionId)
                    .HasConstraintName("FK__answerDet__quest__6FE99F9F");

                entity.HasOne(d => d.Quiz)
                    .WithMany(p => p.AnswerDetails)
                    .HasForeignKey(d => d.QuizId)
                    .HasConstraintName("FK__answerDet__quizI__70DDC3D8");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AnswerDetails)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__answerDet__userI__71D1E811");
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

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.CategoryId).HasColumnName("categoryId");

                entity.Property(e => e.CategoryName)
                    .HasMaxLength(255)
                    .HasColumnName("categoryName");

                entity.Property(e => e.Value)
                    .HasMaxLength(255)
                    .HasColumnName("value");
            });

            modelBuilder.Entity<CustomerExam>(entity =>
            {
                entity.HasKey(e => e.CeId)
                    .HasName("PK__Customer__51ADD27C8AF1166C");

                entity.ToTable("Customer_Exam");

                entity.Property(e => e.CeId).HasColumnName("CE_id");

                entity.Property(e => e.DateTaken)
                    .HasColumnType("date")
                    .HasColumnName("date_taken");

                entity.Property(e => e.ExamId).HasColumnName("examId");

                entity.Property(e => e.TimeExam).HasColumnName("time_exam");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.HasOne(d => d.Exam)
                    .WithMany(p => p.CustomerExams)
                    .HasForeignKey(d => d.ExamId)
                    .HasConstraintName("FK_Customer_Exam_Exam");
            });

            modelBuilder.Entity<CustomerExamDetail>(entity =>
            {
                entity.HasKey(e => e.CeId)
                    .HasName("PK__Customer__51ADD27C728B7DE5");

                entity.ToTable("Customer_Exam_Detail");

                entity.Property(e => e.CeId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("CE_id");

                entity.Property(e => e.AnswerId).HasColumnName("answerId");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                entity.Property(e => e.Truth).HasColumnName("truth");

                entity.HasOne(d => d.Ce)
                    .WithOne(p => p.CustomerExamDetail)
                    .HasForeignKey<CustomerExamDetail>(d => d.CeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Customer_Exam_Customer_Exam");

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.CustomerExamDetails)
                    .HasForeignKey(d => d.QuestionId)
                    .HasConstraintName("FK_Customer_Exam_Detail_Question");
            });

            modelBuilder.Entity<Dimension>(entity =>
            {
                entity.HasKey(e => e.DimId);

                entity.ToTable("Dimension");

                entity.Property(e => e.DimId).HasColumnName("dimId");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .HasColumnName("description");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");

                entity.Property(e => e.TypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("typeId");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Dimensions)
                    .HasForeignKey(d => d.TypeId)
                    .HasConstraintName("FK_Dimension_Type");
            });

            modelBuilder.Entity<Exam>(entity =>
            {
                entity.ToTable("Exam");

                entity.Property(e => e.ExamId).HasColumnName("examId");

                entity.Property(e => e.CategoryId).HasColumnName("categoryId");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("content");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("created_date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ExamTypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("exam_typeId");

                entity.Property(e => e.IsFree).HasColumnName("isFree");

                entity.Property(e => e.Level)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("level");

                entity.Property(e => e.Number).HasColumnName("number");

                entity.Property(e => e.PassRate).HasColumnName("passRate");

                entity.Property(e => e.SubId).HasColumnName("subId");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnType("date")
                    .HasColumnName("updated_date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Exams)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Exam_Category");

                entity.HasOne(d => d.ExamType)
                    .WithMany(p => p.Exams)
                    .HasForeignKey(d => d.ExamTypeId)
                    .HasConstraintName("FK_Exam_Exam_Type");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Exams)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Exam_User");
            });

            modelBuilder.Entity<ExamDetail>(entity =>
            {
                entity.HasKey(e => e.ExamId)
                    .HasName("PK__Exam_Det__A56D125F7B25D96A");

                entity.ToTable("Exam_Detail");

                entity.Property(e => e.ExamId)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("examId");

                entity.Property(e => e.QuesId).HasColumnName("quesId");

                entity.HasOne(d => d.Exam)
                    .WithOne(p => p.ExamDetail)
                    .HasForeignKey<ExamDetail>(d => d.ExamId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Exam_Detail_Exam");

                entity.HasOne(d => d.Ques)
                    .WithMany(p => p.ExamDetails)
                    .HasForeignKey(d => d.QuesId)
                    .HasConstraintName("FK_Exam_Detail_Question");
            });

            modelBuilder.Entity<ExamType>(entity =>
            {
                entity.ToTable("Exam_Type");

                entity.Property(e => e.ExamTypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("exam_typeId");

                entity.Property(e => e.ExamTypeName)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("exam_typeName");
            });

            modelBuilder.Entity<Lesson>(entity =>
            {
                entity.ToTable("Lesson");

                entity.Property(e => e.LessonId).HasColumnName("lessonId");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("content");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.LessonName)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("lessonName");

                entity.Property(e => e.Order).HasColumnName("order");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubId).HasColumnName("subId");

                entity.Property(e => e.TopicId).HasColumnName("topicId");

                entity.Property(e => e.TypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("typeId");

                entity.Property(e => e.VideoUrl)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("video_url");

                entity.HasOne(d => d.Sub)
                    .WithMany(p => p.Lessons)
                    .HasForeignKey(d => d.SubId)
                    .HasConstraintName("FK_Lesson_Subject");
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

                entity.Property(e => e.SalePrice).HasColumnName("salePrice");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<Question>(entity =>
            {
                entity.ToTable("Question");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .HasColumnName("content");

                entity.Property(e => e.DimmensionId).HasColumnName("dimmensionId");

                entity.Property(e => e.IsMultipleChoice).HasColumnName("isMultipleChoice");

                entity.Property(e => e.LessonId).HasColumnName("lessonId");

                entity.Property(e => e.Level)
                    .HasMaxLength(255)
                    .HasColumnName("level");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubjectId).HasColumnName("subjectId");

                entity.Property(e => e.TopicId).HasColumnName("topicId");

                entity.HasOne(d => d.Lesson)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.LessonId)
                    .HasConstraintName("FK_Question_Lesson");

                entity.HasOne(d => d.Subject)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.SubjectId)
                    .HasConstraintName("FK_Question_Subject");

                entity.HasOne(d => d.Topic)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.TopicId)
                    .HasConstraintName("FK_Question_Topic");
            });

            modelBuilder.Entity<QuestionDimension>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("QuestionDimension");

                entity.Property(e => e.DimId).HasColumnName("dimId");

                entity.Property(e => e.QuestionId).HasColumnName("questionId");

                entity.HasOne(d => d.Dim)
                    .WithMany()
                    .HasForeignKey(d => d.DimId)
                    .HasConstraintName("FK_QuestionDimension_Dimension");

                entity.HasOne(d => d.Question)
                    .WithMany()
                    .HasForeignKey(d => d.QuestionId)
                    .HasConstraintName("FK_QuestionDimension_Question");
            });

            modelBuilder.Entity<QuestionQuiz>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Question_Quiz");

                entity.Property(e => e.QuesId).HasColumnName("quesId");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.HasOne(d => d.Ques)
                    .WithMany()
                    .HasForeignKey(d => d.QuesId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Question_Quiz_Question");

                entity.HasOne(d => d.Quiz)
                    .WithMany()
                    .HasForeignKey(d => d.QuizId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Question_Quiz_Quiz");
            });

            modelBuilder.Entity<Quiz>(entity =>
            {
                entity.ToTable("Quiz");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.Property(e => e.Attempt).HasColumnName("attempt");

                entity.Property(e => e.Description)
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.Duration).HasColumnName("duration");

                entity.Property(e => e.EndTime).HasColumnName("end_time");

                entity.Property(e => e.HasJoin).HasColumnName("hasJoin");

                entity.Property(e => e.ImgUrl)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("img_url");

                entity.Property(e => e.LessonId).HasColumnName("lessonId");

                entity.Property(e => e.Level)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("level");

                entity.Property(e => e.QuesId).HasColumnName("quesId");

                entity.Property(e => e.Rate).HasColumnName("rate");

                entity.Property(e => e.StartTime).HasColumnName("start_time");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubId).HasColumnName("subId");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.Property(e => e.TotalQues).HasColumnName("totalQues");

                entity.Property(e => e.TypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("typeId");

                entity.Property(e => e.UserId).HasColumnName("userId");

                entity.HasOne(d => d.Lesson)
                    .WithMany(p => p.Quizzes)
                    .HasForeignKey(d => d.LessonId)
                    .HasConstraintName("FK_Quiz_Lesson");

                entity.HasOne(d => d.Sub)
                    .WithMany(p => p.Quizzes)
                    .HasForeignKey(d => d.SubId)
                    .HasConstraintName("FK_Quiz_Subject");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Quizzes)
                    .HasForeignKey(d => d.TypeId)
                    .HasConstraintName("FK_Quiz_Type");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Quizzes)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Quiz_User");
            });

            modelBuilder.Entity<QuizPoint>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("QUIZ_POINT");

                entity.Property(e => e.Attempt).HasColumnName("attempt");

                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id");

                entity.Property(e => e.NumQuesTrue).HasColumnName("numQuesTrue");

                entity.Property(e => e.Point).HasColumnName("point");

                entity.Property(e => e.PointPercent).HasColumnName("pointPercent");

                entity.Property(e => e.QuizId).HasColumnName("quizId");

                entity.Property(e => e.TakenDate)
                    .HasColumnType("date")
                    .HasColumnName("taken_date");

                entity.Property(e => e.UserId).HasColumnName("userId");
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

                entity.Property(e => e.Statis)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("statis");

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

            modelBuilder.Entity<Setting>(entity =>
            {
                entity.ToTable("Setting");

                entity.Property(e => e.SettingId)
                    .ValueGeneratedNever()
                    .HasColumnName("settingId");

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.TypeId)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("typeId");

                entity.Property(e => e.Value)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("value");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Settings)
                    .HasForeignKey(d => d.TypeId)
                    .HasConstraintName("FK_Setting_Type");
            });

            modelBuilder.Entity<Slider>(entity =>
            {
                entity.ToTable("Slider");

                entity.Property(e => e.SliderId).HasColumnName("sliderId");

                entity.Property(e => e.Backlink)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("backlink");

                entity.Property(e => e.Content)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("content");

                entity.Property(e => e.IsShow).HasColumnName("isShow");

                entity.Property(e => e.Notes)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("notes");

                entity.Property(e => e.SliderUrl)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("slider_url");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubId).HasColumnName("subId");

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.HasOne(d => d.Sub)
                    .WithMany(p => p.Sliders)
                    .HasForeignKey(d => d.SubId)
                    .HasConstraintName("FK_Slider_Subject");
            });

            modelBuilder.Entity<Subject>(entity =>
            {
                entity.ToTable("Subject");

                entity.Property(e => e.SubjectId).HasColumnName("subjectId");

                entity.Property(e => e.CategoryId).HasColumnName("categoryId");

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

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Subjects)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Subject_Category");
            });

            modelBuilder.Entity<SubjectDimension>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("SubjectDimension");

                entity.Property(e => e.DimId).HasColumnName("dimId");

                entity.Property(e => e.SubjectId).HasColumnName("subjectId");

                entity.HasOne(d => d.Dim)
                    .WithMany()
                    .HasForeignKey(d => d.DimId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SubjectDimension_Dimension");

                entity.HasOne(d => d.Subject)
                    .WithMany()
                    .HasForeignKey(d => d.SubjectId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SubjectDimension_Subject");
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

            modelBuilder.Entity<Topic>(entity =>
            {
                entity.ToTable("Topic");

                entity.Property(e => e.TopicId).HasColumnName("topicId");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.SubId).HasColumnName("subId");
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
