<Query Kind="Expression">
  <Connection>
    <ID>9291d9fc-f3fd-4d87-8548-15e8d746bcd3</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

from cat in MenuCategories
orderby cat.Description
select new
{
	Description = cat.Description,
	MenuItems = from food in cat.Items
		where food.Active
		select new
			{
				Description = food.Description,
				Price = food.CurrentPrice
			}
}