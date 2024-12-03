using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.PricePackages
{
    public class IndexModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public IndexModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        public IList<PricePackage> PricePackage { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.PricePackages != null)
            {
                PricePackage = await _context.PricePackages.ToListAsync();
            }
        }
    }
}
