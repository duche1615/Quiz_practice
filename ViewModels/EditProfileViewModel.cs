using System.ComponentModel.DataAnnotations;

namespace Quizpractice.ViewModels
{
    public class EditProfileViewModel
    {
        [Required(ErrorMessage = "Full name is required.")]
        [StringLength(50, ErrorMessage = "Full name cannot exceed 50 characters.")]
        public string Fullname { get; set; }

        [Phone(ErrorMessage = "Invalid phone number format.")]
        [RegularExpression(@"^(\+?[0-9]{1,3})?([0-9]{10})$", ErrorMessage = "Invalid phone number format.")]
        public string? Phone { get; set; }

        [StringLength(200, ErrorMessage = "Address cannot exceed 200 characters.")]
        public string? Address { get; set; }

        [Required(ErrorMessage = "Gender is required.")]
        public bool? Gender { get; set; }
    }
}
