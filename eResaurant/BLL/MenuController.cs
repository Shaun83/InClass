using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.ComponentModel;
using eRestaurant.Entities;
using eRestaurant.DAL;


namespace eRestaurant.BLL
{
    [DataObject]
    public class MenuController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
	    public List<Item> ListMenuItems()
        {
            using (var context = new RestaurantContext())
            {
                //Get the Item data and include the Category Data for each item
                return context.Items.Include(x => x.Category).ToList();
            }
        }
    }
}
