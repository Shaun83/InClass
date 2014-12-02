<Query Kind="Program">
  <Connection>
    <ID>0a036852-c337-4a18-bff2-f4e2ea94a324</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eTools</Database>
  </Connection>
</Query>

void Main()
{
	var result = from data in Vendors
	select new Stuff()
	{
	Vendor = data.VendorName,
	OpenOrder = data.PurchaseOrders.Any(x=>x.OrderDate == null),
	PurchaseOrder = data.PurchaseOrders.FirstOrDefault(x=>x.OrderDate == null),
	PurchaseOrderID = data.PurchaseOrders.Any(x=>x.OrderDate == null) ?
					  data.PurchaseOrders.SingleOrDefault(x=>x.OrderDate == null).PurchaseOrderID
					  : 0
	
	};
	result.Dump();
}

public class Stuff
{
public string Vendor {get; set;}
public bool OpenOrder {get; set;}
public PurchaseOrders PurchaseOrder {get; set;}
public int PurchaseOrderID {get; set;}

}
// Define other methods and classes here

