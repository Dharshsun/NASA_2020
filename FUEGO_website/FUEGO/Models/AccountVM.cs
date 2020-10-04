using System.ComponentModel.DataAnnotations;

namespace FUEGO.Models
{
    public class LoginVM
    {
        [Required(ErrorMessage = "Email address is required")]
        public string email { get; set; }
        [Required(ErrorMessage = "Password is required")]
        public string password { get; set; }
    }
    public class RegisterVM
    {
        [Required(ErrorMessage = "Email address is required")]
        [EmailAddress(ErrorMessage = "Valid email is required")]
        public string email { get; set; }
        [Required(ErrorMessage = "Password is required")]
        public string password { get; set; }
        [Compare("password", ErrorMessage = "Password do not match")]
        public string confirmPassword { get; set; }
    }
}