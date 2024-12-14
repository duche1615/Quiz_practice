using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Pages.Users
{
    [Authorize(Roles = "Admin")]

    public class EditModel : PageModel
    {
        private readonly IUserRepository _userRepository;
        private readonly IRoleRepository _roleRepository;

        public EditModel(IUserRepository userRepository, IRoleRepository roleRepository)
        {
            _userRepository = userRepository;
            _roleRepository = roleRepository;
        }

        [BindProperty]
        public User User { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _userRepository.GetAllUsers().Result == null)
            {
                return NotFound();
            }

            var user = await _userRepository.FindById(id.Value);
            if (user == null)
            {
                return NotFound();
            }
            User = user;
            ViewData["role"] = _roleRepository.GetAllRoles().Result;
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            User user = new User();
            if (!ModelState.IsValid)
            {
                return Page();
            }
            else
            {
                if (ModelState.TryGetValue("User.UserId", out ModelStateEntry userIdEntry)) { user.UserId = int.Parse(userIdEntry.AttemptedValue); }
                user = _userRepository.FindById(user.UserId).Result;
                if (ModelState.TryGetValue("User.Username", out ModelStateEntry usernameEntry)) { user.Username = usernameEntry.AttemptedValue; }
                if (ModelState.TryGetValue("User.Password", out ModelStateEntry passwordEntry)) { user.Password = passwordEntry.AttemptedValue; }
                if (ModelState.TryGetValue("User.Email", out ModelStateEntry emailEntry)) { user.Email = emailEntry.AttemptedValue; }
                if (ModelState.TryGetValue("User.Phone", out ModelStateEntry phoneEntry)) { user.Phone = phoneEntry.AttemptedValue; }
                if (ModelState.TryGetValue("User.Fullname", out ModelStateEntry fullnameEntry)) { user.Fullname = fullnameEntry.AttemptedValue; }
                if (ModelState.TryGetValue("User.Address", out ModelStateEntry addressEntry)) { user.Address = addressEntry.AttemptedValue; }
                if (ModelState.TryGetValue("User.Gender", out ModelStateEntry genderEntry)) { user.Gender = bool.Parse(genderEntry.AttemptedValue); }
                if (ModelState.TryGetValue("User.Status", out ModelStateEntry statusEntry))
                {
                    user.Status = bool.Parse(statusEntry.AttemptedValue);
                }
                if (ModelState.TryGetValue("User.RoleId", out ModelStateEntry roleIdEntry))
                {
                    int roleid = int.Parse(roleIdEntry.AttemptedValue);
                    user.RoleId = roleid;
                    //user.Role = _roleRepository.GetById(roleid).Result;
                }
                if (ModelState.TryGetValue("User.CreatedDate", out ModelStateEntry createdDateEntry)) { user.CreatedDate = DateTime.Parse(createdDateEntry.AttemptedValue); }
                user.ModifyDate = DateTime.Now;
            }
            if (_userRepository.UpdateUser(user))
            {
                return RedirectToPage("./Index");

            }
            return Page();
        }
    }
}
