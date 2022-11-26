DOMAINS
	name = symbol
	phone_number = integer
	city, street = symbol
	building, door = integer
	
	adrs = address(city, street, building, door)
	
	mark, color = symbol
	price = integer
	
	bank_name = symbol
	acc_number, amount = integer

PREDICATES
	contact(name, phone_number, adrs)
	car(name, mark, color, price)
	bank(name, bank_name, acc_number, amount)
	
	car_by_contact(phone_number, name, mark, price)
	
	info_by_name_city(name, city, street, bank_name, phone_number) 
	
	info_by_mark_color(mark, color, name, city, phone_number, bank_name)
	
CLAUSES
	contact("John", 123, address("New York", "Broadway", 12, 99)).
	contact("John", 321, address("Berlin", "Burklag", 2, 9)).
	contact("John", 009, address("Manchester", "Birmighan", 3, 111)).
	contact("Liam", 987, address("Manchester", "Hallway", 88, 180)).
	contact("Liam", 789, address("LA", "Hollywood", 8, 19980)).
	contact("Liam", 333, address("Beijing", "Sanli", 33, 37)).
	contact("Alex", 567, address("Beijing", "Mandu", 999, 67)).
	
	car("John", "Tesla", "grey", 12333).
	car("John", "Hyundai", "black", 432).
	car("Liam", "Benz", "white", 999).
	car("Liam", "Volkswagen", "black", 34323).
	car("Alex", "Toyota", "red", 333).
	car("Alex", "Benz", "white", 39000).
	
	bank("John", "AmericanBank", 1231231, 999999999).
	bank("John", "USbank", 32132999, 77777).
	bank("Liam", "UKbank", 7889, 899899).
	bank("Liam", "Sberbank", 232323, 98899).
	bank("Alex", "Unionbank", 654, 345345354).
	bank("Alex", "Beibank", 123, 345111).
	bank("Alex", "USbank", 999000, 345345).
	
	car_by_contact(Phone, Name, Mark, Price) :- 
		contact(Name, Phone, _), 
		car(Name, Mark, _, Price).	
	
	info_by_name_city(Name, City, Street, Bank, Phone) :- 
		contact(Name, Phone, address(City, Street, _, _)), 
		bank(Name, Bank, _, _).
		
	info_by_mark_color(Mark, Color, Name, City, Phone, Bank) :-
		car(Name, Mark, Color, _),
		contact(Name, Phone, address(City, _, _, _)), 
		bank(Name, Bank, _, _).
	
GOAL
	car_by_contact(123, N, M, P).
	%car_by_contact(123, _, _, _).
/*
N=John, M=Tesla, P=12333
N=John, M=Hyundai, P=432
2 Solutions
*/

	%car_by_contact(123, _, M, _).
/*
M=Tesla
M=Hyundai
2 Solutions
*/

	%info_by_name_city("Liam", "LA", Street, Bank, Phone).
/*
Street=Hollywood, Bank=UKbank, Phone=789
Street=Hollywood, Bank=Sberbank, Phone=789
2 Solutions
*/

	%info_by_mark_color("Benz", "white", Name, City, Phone, Bank).
/*
Name=Liam, City=Manchester, Phone=987, Bank=UKbank
Name=Liam, City=Manchester, Phone=987, Bank=Sberbank
Name=Liam, City=LA, Phone=789, Bank=UKbank
Name=Liam, City=LA, Phone=789, Bank=Sberbank
Name=Liam, City=Beijing, Phone=333, Bank=UKbank
Name=Liam, City=Beijing, Phone=333, Bank=Sberbank
Name=Alex, City=Beijing, Phone=567, Bank=Unionbank
Name=Alex, City=Beijing, Phone=567, Bank=Beibank
Name=Alex, City=Beijing, Phone=567, Bank=USbank
9 Solutions
*/
	%info_by_mark_color("Tesla", "orange", Name, City, Phone, Bank).

