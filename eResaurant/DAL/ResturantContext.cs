﻿using eResaurant.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity; //Needed for DdContext
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eResaurant.DAL
{
    public class ResturantContext : DbContext
    {

        #region Constructor
        public ResturantContext() : base("name=EatIn") { }
        #endregion



        #region Properties for Table-Entity mappings
        public DbSet<Reservation> Reservations { get; set; }
        public DbSet<Table> Tables { get; set; }
        public DbSet<SpecialEvent> SpecialEvents { get; set; }
        public DbSet<Bill> Bills { get; set; }
        public DbSet<MenuCategory> MenuCategories { get; set; }
        public DbSet<Waiter> Waiters { get; set; }
        public DbSet<BillItem> BillItems { get; set; }
        #endregion 

        #region Over-ride OnModelCreating
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
          modelBuilder
              .Entity<Reservation>().HasMany(r => r.Tables)
              .WithMany (t => t.Reservation)
              .Map(mapping =>
            {
            mapping.ToTable("ReservatoinTables");
            mapping.MapLeftKey("ReservationID");
            mapping.MapRightKey("TableID");
        });
          base.OnModelCreating(modelBuilder);
        }
        #endregion
    }
}
