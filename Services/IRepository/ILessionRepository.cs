using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface ILessionRepository
    {
        Task<List<Lession>> GetAllLessions();
        Task<List<Lession>> GetAllLessionsByChapterId(int id);
        Task<Lession> GetLessionById(int id);
        bool UpdateLession(Lession lession);
        bool CreateLession(Lession lession);
    }
}
