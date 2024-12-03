using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Quizpractice.Models;

namespace Quizpractice.Pages.PricePackages
{
    public class CreateModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public CreateModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public PricePackage PricePackage { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.PricePackages == null || PricePackage == null)
            {
                return Page();
            }

            _context.PricePackages.Add(PricePackage);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
