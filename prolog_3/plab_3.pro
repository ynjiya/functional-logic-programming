DOMAINS
	firstname = symbol
	name = symbol
	phone_number = integer
	city, street = symbol
	building, door = integer
	
	adrs = address(city, street, building, door)
	
	mark, color = symbol
	price = integer
	
	bank_name = symbol
	acc_number, amount = integer
	
	surface = integer
	motor_power = integer
	
	property = building(name, price, adrs);
		land(name, price, surface);
		water_trans(name, price, motor_power);
		car(name, color, price).
		

PREDICATES
	contact(firstname, phone_number, adrs)
	bank(firstname, bank_name, acc_number, amount)
	owns(firstname, property)
	property_name(firstname, name)
    property_name_price(firstname, name, price)
    property_sum_price(firstname, integer)
    
CLAUSES
	contact("John", 123, address("New York", "Broadway", 12, 99)).
	contact("John", 321, address("Berlin", "Burklag", 2, 9)).
	contact("John", 009, address("Manchester", "Birmighan", 3, 111)).
	contact("Liam", 987, address("Manchester", "Hallway", 88, 180)).
	contact("Liam", 789, address("LA", "Hollywood", 8, 19980)).
	contact("Liam", 333, address("Beijing", "Sanli", 33, 37)).
	contact("Alex", 567, address("Beijing", "Mandu", 999, 67)).
	
	bank("John", "AmericanBank", 1231231, 999999999).
	bank("John", "USbank", 32132999, 77777).
	bank("Liam", "UKbank", 7889, 899899).
	bank("Liam", "Sberbank", 232323, 98899).
	bank("Alex", "Unionbank", 654, 345345354).
	bank("Alex", "Beibank", 123, 345111).
	bank("Alex", "USbank", 999000, 345345).
	
	owns("John", building("Home", 10, address("New York", "Broadway", 12, 99))).
	owns("John", land("Pole", 200, 200)).
	owns("John", water_trans("Yacht1", 3000, 90)).
	owns("John", car("Tesla", "grey", 40000)).
	
	owns("Alex", building("Shop", 40, address("Bali", "Hons", 1332, 997))).
	owns("Alex", land("Island", 300, 2300)).
	owns("Alex", water_trans("Yacht2", 2000, 80)).
	owns("Alex", car("Benz", "white", 10000)).
	
	
  	property_name(Firstname, Name) :- owns(Firstname, building(Name, _, _)).
  	property_name(Firstname, Name) :- owns(Firstname, land(Name, _, _)).
  	property_name(Firstname, Name) :- owns(Firstname, water_trans(Name, _, _)).
	property_name(Firstname, Name) :- owns(Firstname, car(Name, _, _)).
	
	
	property_name_price(Firstname, Name, Price) :- owns(Firstname, building(Name, Price, _)).
  	property_name_price(Firstname, Name, Price) :- owns(Firstname, land(Name, Price, _)).
  	property_name_price(Firstname, Name, Price) :- owns(Firstname, water_trans(Name, Price, _)).
	property_name_price(Firstname, Name, Price) :- owns(Firstname, car(Name, _, Price)).
	
	property_sum_price(Firstname, Sum) :-
	owns(Firstname, building(_, Bp, _)),
	owns(Firstname, land(_, Lp, _)),
	owns(Firstname, water_trans(_, Wp, _)),
	owns(Firstname, car(_, _, Cp)),
	Sum = Bp + Lp + Wp + Cp.
	
GOAL
	property_name_price("Alex", N, P).
/*
N=Shop, P=40
N=Island, P=300
N=Yacht2, P=2000
N=Benz, P=10000
4 Solutions
*/

	%property_sum_price("Alex", Sum).
/*
Sum=12340
1 Solution
*/