using Microsoft.AspNetCore.Mvc.RazorPages;
using Quizpractice.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace QuizletApp.Pages.Blogs
{
    public class IndexModel : PageModel
    {
        private readonly SWP391_DBContext _context;

        public IndexModel(SWP391_DBContext context)
        {
            _context = context;
        }

        public List<Blog> Blogs { get; set; }
        public string SearchQuery { get; set; }

        public void OnGet(string searchQuery)
        {
            SearchQuery = searchQuery ?? string.Empty;

            if (string.IsNullOrEmpty(SearchQuery))
            {
                Blogs = _context.Blogs.ToList();
            }
            else
            {
                Blogs = _context.Blogs
                    .Where(b => b.BlogName != null && b.BlogName.ToLower().Contains(SearchQuery.ToLower()))
                    .ToList();
            }
        }
    }
}
