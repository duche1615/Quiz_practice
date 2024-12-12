using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using System.Linq;

namespace QuizletApp.Pages.Blogs
{
    public class BlogDetailModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public BlogDetailModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public Blog Blog { get; set; }

        // Xử lý lấy thông tin chi tiết blog
        public IActionResult OnGet(int blogId)
        {
            Blog = _context.Blogs.FirstOrDefault(b => b.BlogId == blogId);

            if (Blog == null)
            {
                return NotFound();
            }

            return Page();
        }
    }
}
