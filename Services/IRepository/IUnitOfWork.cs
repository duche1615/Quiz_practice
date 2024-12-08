namespace Quizpractice.Services.IRepository
{
    public interface IUnitOfWork
    {
        IQuestionRepository Questions { get; }
        IAnswerRepository Answers { get; }
        ISubjectRepository Subjects { get; }
        IChapterRepository Chapters { get; }
        IQuizRepository Quizzes { get; }
        Task SaveAsync();
    }
}
