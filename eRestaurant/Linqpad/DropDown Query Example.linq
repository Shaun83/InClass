<Query Kind="Program">
  <Connection>
    <ID>757a973e-cf10-4c95-a6bd-b82677815f30</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

void Main()
{
	var result = from data in Tables
	select new Stuff()
	{
	Table = "Table" + data.TableNumber.ToString(),
	NotPaid = data.Bills.Any(x=>x.PaidStatus == false),
	Bill = data.Bills.FirstOrDefault(x=>x.PaidStatus == false),
	BillID = data.Bills.Any(x=>x.PaidStatus==false) ?
			data.Bills.SingleOrDefault(x=>x.PaidStatus==false).BillID
			: 0
	};
	result.Dump();
}

// Define other methods and classes here
public class Stuff
{
	public string Table{get;set;}
	public bool NotPaid {get; set;}
	public Bills Bill {get; set;}
	public int BillID {get; set;}
	public string Name
	{
		get
		{ 
		if(BillID == 0) return "nada";
		else return Table + "(" + BillID + ")";
		}
	}
	
}