# GalconWebApi

## Installation:
	- Open CMD
	- Clone the project from git
		* git clone https://github.com/SergeyZimakov/GalconWebApi.git
	- Open "appsettings.json" file and edit the "DB_ConnectionString"
	- Open "SQL_Script.sql" file and run the script in Microsoft SQL Management Studio(script will create the data base including tables, sp, data)
	- Enter the folder
		* cd GalconWebApi
	- Install dependecies, build and run the project 
		* dotnet run

## Using API:
	- The project will run on port 1205(you can set another port in "appsettings.json")
	- Data Base includes few users:
		1. UserName: 'admin', Password: 'admin'
		2. UserName: 'User1', Password: 'user1'
		3. UserName: 'User2', Password: 'user2'
	- Data Base includes orders for each user(all orders made in different days of Jan 2023)

## Endpoints:
	**_All endpoints except of login require authorization_**
	**_To authorize get token from login response, choose Bearer Token Authorization Type and put there the token from response_**

	- login:
		* route - http://localhost:1205/api/login
		* method - post
		* body - {"UserName": "", "Password": ""}
		* if user successfuly logged in, the response will include JWT token, that required to access next endpoints
		* for example:
			post http://localhost:1205/api/login body: {"UserName": "user1", "Password": "user1"}
	
	- users by role:
		* route - http://localhost:1205/api/users/role
		* method - get
		* for example:
			get http://localhost:1205/api/users/admin
			get http://localhost:1205/api/users/user
			
	- orders by user:
		* route - http://localhost:1205/api/orders?user=N
		* method - get
		* for example:
			get http://localhost:1205/api/orders?user=2
		*if you will not provide user in query string, the API will return all orders without filter by user*

	- total price by user and dates:
		* route - http://localhost:1205/api/orders?user=N&from=dd/mm/yyyy&to=dd/mm/yyyy
		* method - get
		* for example:
			get http://localhost:1205/api/orders?user=2&from=02/01/2023&to=15/01/2023
		*Dates must be in DD/MM/YYYY format*
		*All query parameters are required*