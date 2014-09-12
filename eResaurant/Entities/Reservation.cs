﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eResaurant.Entities
{
    public class Reservation
    {
        public int ReservationID { get; set; }
        public string CustomerName {get; set;}
        public DateTime ReservationDate { get; set; }
        public int NumberInParty { get; set; }
        public string ContractPhone { get; set; }
        public string ReservationStatus { get; set; }
        public string EventCode { get; set; }

        #region Navigation Properties
        public virtual ICollection<Table> Tables { get; set; }
        public virtual SpecialEvent SpecialEvent { get; set; }

    }
}
