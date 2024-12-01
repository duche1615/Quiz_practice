namespace Quizpractice.Services.IRepository
{
    public interface IUnitOfWork
    {
        IQuestionRepository Questions { get; }
        IAnswerRepository Answers { get; }
        Task SaveAsync();
    }
}
