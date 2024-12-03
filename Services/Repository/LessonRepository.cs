using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class LessonRepository : BaseRepository<Lesstion>, ILessonRepository
    {
        private readonly SWP391_DBContext _context;
        public LessonRepository(SWP391_DBContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Lesstion>> GetLessonsByPackageIdAsync(int packageId)
        {
            var lessons = await (from pp in _context.PricePackages
                                 join sp in _context.SubjectPrices on pp.PriceId equals sp.PriceId
                                 join s in _context.Subjects on sp.SubjectId equals s.SubjectId
                                 join l in _context.Lesstions on s.SubjectId equals l.Subid
                                 where pp.PriceId == packageId
                                 select l).ToListAsync();

            return lessons;
        }

        public async Task ActivateDeactivateLessonAsync(int lessonId, bool isActive)
        {
            var lesson = await GetByIdAsync(lessonId);
            if (lesson != null)
            {
                lesson.Status = !lesson.Status;
                await UpdateAsync(lesson);
            }
        }
    }

}
