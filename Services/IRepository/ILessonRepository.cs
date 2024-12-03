using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface ILessonRepository
    {
        Task<IEnumerable<Lesstion>> GetLessonsByPackageIdAsync(int packageId);
        Task ActivateDeactivateLessonAsync(int lessonId, bool isActive);
        Task<Lesstion> GetByIdAsync(int value);
        Task AddAsync(Lesstion lesson);
        Task UpdateAsync(Lesstion lesson);
    }
}
