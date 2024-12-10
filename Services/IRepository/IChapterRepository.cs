using Quizpractice.Models;

namespace Quizpractice.Services.IRepository
{
    public interface IChapterRepository
    {
        Task<List<Chapter>> GetAllChapters();
        Task<Chapter> GetChapterById(int id);
        Task<List<Chapter>> GetAllChaptersBySubjectId(int id);
        bool UpdateChapter(Chapter chapter);
        bool CreateChapter(Chapter chapter);
    }
}
