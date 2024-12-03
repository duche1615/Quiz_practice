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
    public class DetailsModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public DetailsModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

      public PricePackage PricePackage { get; set; } = default!; 

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.PricePackages == null)
            {
                return NotFound();
            }

            var pricepackage = await _context.PricePackages.FirstOrDefaultAsync(m => m.PriceId == id);
            if (pricepackage == null)
            {
                return NotFound();
            }
            else 
            {
                PricePackage = pricepackage;
            }
            return Page();
        }
    }
}
