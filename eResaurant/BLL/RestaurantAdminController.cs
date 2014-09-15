using eResaurant.DAL;
using eResaurant.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eResaurant.BLL
{
    class RestaurantAdminController
    {
        #region Manage Waiters
        #region Command
        public int AddWaiter(Waiter item)
        {
            using (RestaurantContext context = new RestaurantContext())
            {
                //TODO: Validation rules...
                var added = context.Waiters.Add(item);
                context.SaveChanges();
                return added.WaiterID;
            }
        }
        public void UpdateWaiter(Waiter item)
        {
            //TODO: Validation rules...
            using (RestaurantContext context = new RestaurantContext())
            {
                var attached = context.Waiters.Attach(item);
                var existing = context.Entry<Waiter>(attached);
                existing.State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        public void DeleteWaiter (Waiter item)
        {
            using (RestaurantContext context = new RestaurantContext())
            {
                var exisitng = context.Waiters.Find(item.WaiterID);
                context.Waiters.Remove(exisitng);
                context.SaveChanges();
            }
        }
        #endregion
        #region Query
        public List<Waiter> ListAllWaiters()
        {
            using (RestaurantContext context = new RestaurantContext())
            {
                return context.Waiters.ToList();
            }
        }

        public Waiter GetWaiter(int waiterId)
        {
            using (RestaurantContext context = new RestaurantContext())
            {
                return context.Waiters.Find(waiterId);
            }
        }
        #endregion
        #endregion

        #region Manage Tables
        #region Command
        #endregion
        #region Query
        #endregion
        #endregion

        #region Manage Items
        #region Command
        #endregion
        #region Query
        #endregion
        #endregion

        #region Manage Special Events
        #region Command
        #endregion
        #region Query
        #endregion
        #endregion
    }
}
