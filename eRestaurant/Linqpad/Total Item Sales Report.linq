<Query Kind="Statements">
  <Connection>
    <ID>9291d9fc-f3fd-4d87-8548-15e8d746bcd3</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

var result = from info in BillItems
			 orderby info.Item.MenuCategory.Description, info.Item.Description
			 select new 
			 {
			 	CategoryDescription = info.Item.MenuCategory.Description,
				ItemDescription = info.Item.Description, 
				Quantity = info.Quantity,
				Price = info.SalePrice * info.Quantity,
				Cost = info.UnitCost * info.Quantity
			 };
result.Count().Dump();			 
result.Dump();
