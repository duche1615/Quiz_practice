using System.ComponentModel.DataAnnotations;

namespace Quizpractice.ViewModels
{
    public class EditProfileViewModel
    {
        [Required(ErrorMessage = "Full name is required.")]
        [StringLength(50, ErrorMessage = "Full name cannot exceed 50 characters.")]
        public string Fullname { get; set; }
        [Required(ErrorMessage = "Phone is required.")]
        [Phone(ErrorMessage = "Invalid phone number format.")]
        [RegularExpression(@"^0[0-9]{9}$", ErrorMessage = "Invalid phone number format.")]
        public string? Phone { get; set; }

        [StringLength(200, ErrorMessage = "Address cannot exceed 200 characters.")]
        public string? Address { get; set; }

        [Required(ErrorMessage = "Gender is required.")]
        public bool? Gender { get; set; }
    }
}
