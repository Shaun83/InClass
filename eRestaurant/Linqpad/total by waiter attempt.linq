<Query Kind="Statements">
  <Connection>
    <ID>757a973e-cf10-4c95-a6bd-b82677815f30</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

var month = DateTime.Today.Month - 1;
var year = DateTime.Today.Year;
var billsInMonth = from info in Bills
					where info.BillDate.Month == month
						&& info.BillDate.Year == year
						select new 
					{
						BillDate = info.BillDate,
						BillId = info.BillID,
						TotalAmount = info.BillItems.Sum(bi => bi.Quantity * bi.SalePrice),
						Waiter = info.WaiterID
				};
				
billsInMonth.Dump("Raw Bill date for month/year");	


var report = from item in Bills
			group item by item.Waiter into Waiters //new var created on the fly.
			select new
			{
				Waiter = Waiters.Key,
				Income = Waiters.Sum(grp => grp.TotalAmount)
				
			};
report.Dump("Daily Income Report by Waiter ");