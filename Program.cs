using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;
using Quizpractice.Services.Repository;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<SWP391_DBContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("MyDatabase")));

builder.Services.AddScoped<IUserRepository,UserRepository>();
builder.Services.AddScoped<IQuestionRepository, QuestionRepository>();
builder.Services.AddScoped<IAnswerRepository, AnswerRepository>();
builder.Services.AddScoped<IQuizRepository, QuizRepository>();
builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<IRoleRepository, RoleRepository>();
builder.Services.AddScoped<ISubjectRepository, SubjectRepository>();
builder.Services.AddScoped<IChapterRepository, ChapterRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}
app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
