using Quizpractice.Models.Entities;

namespace Quizpractice.Services
{
    public interface ISubjectRepository
    {
        public Task<List<Subject>> GetAllSubjects();
    }
}
