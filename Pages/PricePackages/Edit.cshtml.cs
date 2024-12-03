using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;

namespace Quizpractice.Pages.PricePackages
{
    public class EditModel : PageModel
    {
        private readonly Quizpractice.Models.SWP391_DBContext _context;

        public EditModel(Quizpractice.Models.SWP391_DBContext context)
        {
            _context = context;
        }

        [BindProperty]
        public PricePackage PricePackage { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.PricePackages == null)
            {
                return NotFound();
            }

            var pricepackage =  await _context.PricePackages.FirstOrDefaultAsync(m => m.PriceId == id);
            if (pricepackage == null)
            {
                return NotFound();
            }
            PricePackage = pricepackage;
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(PricePackage).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PricePackageExists(PricePackage.PriceId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool PricePackageExists(int id)
        {
          return (_context.PricePackages?.Any(e => e.PriceId == id)).GetValueOrDefault();
        }
    }
}
