using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.Linq;
using Quizpractice.Models;

namespace Quizpractice.Pages.Quizs
{
    public class ListModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public ListModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public IList<Quiz> QuizList { get; set; }
        public IList<Subject> SubjectList { get; set; }
        public int? SelectedSubjectId { get; set; }
        public string SelectedSubjectName { get; set; }

        public void OnGet(int? subjectId)
        {
            // Lấy danh sách môn học
            SubjectList = _context.Subjects.ToList();

            // Kiểm tra nếu subjectId có giá trị
            if (subjectId.HasValue)
            {
                SelectedSubjectId = subjectId;
                SelectedSubjectName = _context.Subjects
                                                .Where(s => s.SubjectId == subjectId)
                                                .Select(s => s.SubjectName)
                                                .FirstOrDefault();

                // Lấy danh sách quiz dựa trên môn học đã chọn
                QuizList = _context.Quizzes
                                    .Where(q => q.SubId == subjectId)
                                    .ToList();
            }
            else
            {
                // Nếu không có môn học nào được chọn, lấy tất cả quiz
                QuizList = _context.Quizzes.ToList();
            }
        }
    }
}
