using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations; // For [Key]
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurant.Entities
{
    public class SpecialEvent
    {
        public SpecialEvent()
        {
            Active = true;
        }

        [Key] //identifies this properties as mapping to an primary key
        [Required(ErrorMessage = "An Event Code is required )one character only)")]
        [StringLength(1,ErrorMessage = "Event Codes can only use a single-character code")]
        public string EventCode {get; set; }
        [Required(ErrorMessage = "A Description is required (5-20characters)")]
        [StringLength(30, MinimumLength = 5, ErrorMessage = "Description must be from 5 to 30 characters in length")]
        public string Description { get; set; }
        public bool Active { get; set; }

        public virtual ICollection<Reservation> Reservations { get; set; }

    }
}
