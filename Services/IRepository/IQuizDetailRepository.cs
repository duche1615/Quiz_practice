namespace Quizpractice.Services.IRepository
{
    public interface IQuizDetailRepository
    {
        int CountQuizAttempt(int quizId);
        int CountQuizPass(int quizId);
        
    }
}
