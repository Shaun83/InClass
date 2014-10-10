<Query Kind="Statements">
  <Connection>
    <ID>757a973e-cf10-4c95-a6bd-b82677815f30</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

/* These statements are to build a report of income and # customers per day
* in a given month/year
*/

//Get the following from the Bills table for a given month/year:
// BillDate, ID, # people served, total amount billed

// 0) Set-up info that would be passed in to my BLL
var month = DateTime.Today.Month - 1;
var year = DateTime.Today.Year;

// 1) Get the Bll data for the month/year with a sum of each bill's items

var billsInMonth = from info in Bills
					where info.BillDate.Month == month
						&& info.BillDate.Year == year
					select new 
					{
						BillDate = info.BillDate,
						BillId = info.BillID,
						NumberOfCustomers = info.NumberInParty,
						TotalAmount = info.BillItems.Sum(bi => bi.Quantity * bi.SalePrice)
				};
// TEMP: for exploring" the results
billsInMonth.Dump("Raw Bill date for month/year");					
billsInMonth.Sum(tb => tb.TotalAmount).Dump("Total Income for month");
billsInMonth.Sum(tb => tb.NumberOfCustomers).Dump("Customers for month");
billsInMonth.Count().Dump("# of bills for month");
var total = billsInMonth.Sum (tb => tb.TotalAmount);
var avg = total /billsInMonth.Count();
avg.Dump("Average ammount per bill");

// 2) Build a report form the billsInMonth data
var report = from item in billsInMonth
			group item by item.BillDate.Day into dailySummary //new var created on the fly.
			select new
			{
				Day = dailySummary.Key,
				DailyCustomers = dailySummary.Sum(grp => grp.NumberOfCustomers),
				Income = dailySummary.Sum(grp => grp.TotalAmount),
				BillCount = dailySummary.Count(),
				AveragePerBill = dailySummary.Sum(grp => grp.TotalAmount) /
								dailySummary.Count()
			};
report.OrderBy(r => r.Day).Dump("Daily Income Report")
			




