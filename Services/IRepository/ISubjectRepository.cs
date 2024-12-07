using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface ISubjectRepository
    {
        Task<List<Subject>> GetAllSubjects();
        Task<Subject> GetById(int id);
        bool Update(Subject subject);
    }
}
