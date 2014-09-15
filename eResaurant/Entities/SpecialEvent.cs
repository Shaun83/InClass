using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations; // For [Key]
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eResaurant.Entities
{
    public class SpecialEvent
    {
        public SpecialEvent()
        {
            Active = true;
        }

        [Key] //identifies this properties as mapping to an primary key
        public string EventCode {get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }

        public virtual ICollection<Reservation> Reservations { get; set; }

    }
}
