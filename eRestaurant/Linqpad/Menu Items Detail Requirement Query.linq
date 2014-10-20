<Query Kind="Expression">
  <Connection>
    <ID>757a973e-cf10-4c95-a6bd-b82677815f30</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eRestaurant</Database>
  </Connection>
</Query>

// This query is for pulling out data to be used in a 
// Details report. The query gets all the menu items
// and their categories, sorting them by the category
// description and then by the menu item description.


from cat in Items
orderby cat.MenuCategory.Description, cat.Description 
select new 
{
	CategorDescription = cat.MenuCategory.Description,
	itemDescription = cat.Description,
	Price = cat.CurrentPrice,
	Calories = cat.Calories,
	Comment = cat.Comment
}