Feature: Verifying Search Hotel Details

Scenario Outline: Verifying login and password details with valid creditials 

Given User is on the Adacatin Page
When User should login and enter "<username>" and "<password>"
Given User should select the all fields in  the hotel search "<location>" "<hotels>" "<roomType>" "<numberofRooms>" "<datecheck>" "<dateout>" "<adultsperRoom>" "<childrenperRoom>"
Then User should click search
Examples:

|username |password  |location |hotels        |roomType|numberofRooms|datecheck |dateout   |adultsperRoom|childrenperRoom
|Gokul2109|gokul@2109|Sydney   |Hotel Creek   |Standard|1 - One       |23/09/2021|25/09/2021|1 - One      |1 - One        |

Scenario Outline: Verifying mandatory fields in search hotel
Given User is on the Adacatin Page
When User should login and enter "<username>" and "<password>""<location>" "<hotels>" "<roomType>" "<numberofRooms>" "<datecheck>" "<dateout>" 
When User should select the location and Number of Rooms,Check In Date,Check Out Date,Adults per Room
Then Without selecting these user should get the error message like Please Select a Location for location
Examples:

|username |password  |location |hotels        |roomType|numberofRooms|datecheck |dateout   |
|Gokul2109|gokul@2109|Sydney   |Hotel Creek   |Standard|1 - One       |23/09/2021|25/09/2021|

Scenario: Verifying Date checking in search hotel
Given User is on the Adacatin Page
When User should login and enter"<username>" and "<password>""<location>" "<hotels>" "<roomType>" "<numberofRooms>" "<datecheck>" "<dateout>"
When User should select the CheckIndate  date and Checkoutdate
And Checkoutdate always after the checkindate
Then Checkoutdate always after the checkindate if not i won't allow to access

Examples:
|username |password  |location |hotels        |roomType|numberofRooms|datecheck |dateout   |
|Gokul2109|gokul@2109|Sydney   |Hotel Creek   |Standard|1 - One       |23/09/2021|25/09/2021|

Scenario: Without enter any field clicking search 
Given User is on the Adacatin Page
When User should login and enter "<username>" and "<password>"
When Without enter any fields by clicking search on Select hotel
Then it is showing error like Please Select a Location
Examples:

username |password  |
|Gokul2109|gokul@2109|

Examples:

Feature: Verifying Booking Details
Scenario: Verifying boking confirmation with all valid creditials 
Given User is on the Adacatin Page
When User should login and enter "<username>" and "<password>""<location>" "<hotels>" "<roomType>" "<numberofRooms>" "<datecheck>" "<dateout>""<firstname>" "<lastname>" "<billingAddress>" "<creditcardno>" "<creditcardtype>" "<expirydate>" "<expiryyear>" "<cvv>"
When User Should book the hotel 
And User Should confirm the the booking and print the order Id 
Then User Should mentioned the sucessmsg
Examples:

|username |password  |location |hotels        |roomType|numberofRooms|datecheck |dateout   |adultsperRoom|childrenperRoom|firstname|lastname|billingAddress                 |creditcardno    |creditcardtype  |expirydate|expiryyear|cvv|
|Gokul2109|gokul@2109|Sydney   |Hotel Creek   |Standard|1 - One       |23/09/2021|25/09/2021|1 - One      |1 - One        |Ranjitha |mary    |2/1239A karpaga vinayagar nagar|1234567890123456|American Express|February  |2022      |808|

Scenario: Verifying boking confirmation without enter valid creditials 
Given User is on the Adacatin Page
When User should login and enter "<username>" and "<password>""<location>" "<hotels>" "<roomType>" "<numberofRooms>" "<datecheck>" "<dateout>"
When If user is not enter any fields and click the booking now 
Then The Error shows Please Enter your First Name,Please Enter you Last Name,Please Enter your Address,Use 16 digit Dummy Data Please Enter your 16 Digit Credit Card Number, Please Select your Credit Card Type,Please Select your Credit Card Expiry Month,Please Enter your Credit Card CVV Number
Examples:

|username |password  |location |hotels        |roomType|numberofRooms|datecheck |dateout   |adultsperRoom|childrenperRoom|firstname|lastname|billingAddress                 |creditcardno    |creditcardtype  |expirydate|expiryyear|cvv|
|Gokul2109|gokul@2109|Sydney   |Hotel Creek   |Standard|1 - One       |23/09/2021|25/09/2021|1 - One      |1 - One        |

Scenario: Cancel Booking
Given User is on the Adacatin Page
When User should login and enter "<username>" and "<password>""<location>" "<hotels>" "<roomType>" "<numberofRooms>" "<datecheck>" "<dateout>""<firstname>" "<lastname>" "<billingAddress>" "<creditcardno>" "<creditcardtype>" "<expirydate>" "<expiryyear>" "<cvv>"
When User Should book the hotel 
When Order has been placed with invalid information 
And By clicking Booked Itineray under search id we need to place the current orderid 
And it shows popup to cancel the order once clicked order canceled
Then User Should mentioned the sucessmsg

Examples:
|username |password  |location |hotels        |roomType|numberofRooms|datecheck |dateout   |adultsperRoom|childrenperRoom|firstname|lastname|billingAddress                 |creditcardno    |creditcardtype  |expirydate|expiryyear|cvv|
|Gokul2109|gokul@2109|Sydney   |Hotel Creek   |Standard|1 - One       |23/09/2021|25/09/2021|1 - One      |1 - One        |Ranjitha |mary    |2/1239A karpaga vinayagar nagar|1234567890123456|American Express|February  |2022      |808|

Scenario: Cancel Booking with existing information
Given User is on the Adacatin Page
When User should login and enter"<location>" "<hotels>" "<roomType>" "<numberofRooms>" "<datecheck>" "<dateout>""<firstname>" "<lastname>" "<billingAddress>" "<creditcardno>" "<creditcardtype>" "<expirydate>" "<expiryyear>" "<cvv>"
When User Should book the hotel 
When Order has been cancled with existing order Id
And By clicking Booked Itineray under search id we need to place the existing orderid 
And it shows popup to cancel the order once clicked order canceled
Then User Should mentioned the sucessmsg

Examples:
|username |password  |location |hotels        |roomType|numberofRooms|datecheck |dateout   |adultsperRoom|childrenperRoom|firstname|lastname|billingAddress                 |creditcardno    |creditcardtype  |expirydate|expiryyear|cvv|
|Gokul2109|gokul@2109|Sydney   |Hotel Creek   |Standard|1 - One       |23/09/2021|25/09/2021|1 - One      |1 - One        |Ranjitha |mary    |2/1239A karpaga vinayagar nagar|1234567890123456|American Express|February  |2022      |808|





