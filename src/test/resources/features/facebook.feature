Feature: verifying Adactin details

   Scenario Outline:  verifying Adactin login with valid credentials
   
   
Given user is on the Adactin page
When user should login "<username>" and "<password>"
And user should search hotel  "<location>" "<hotels>" "<room_type>" "<room_nos>"  "<datepick_in>" "<datepick_out>" "<adult_room>" "<child_room>"
And user should select hotel and click continue button 
And user should book hotel "<firstname>" "<lastname>" "<address>" "<ccnum>" "<cctype>" "<cc_expmonth>" "<cc_expyear>" "<cccvv>"
And user should confirm booking
Then user should verify sucess msg

Examples: 
|username  |password  |location|hotels        |room_type   |room_nos  |datepick_in|datepick_out|adult_room  |child_room  |firstname|lastname|address       |ccnum           |cctype          |cc_expmonth|cc_expyear|cccvv|
|Gokul2109 |gokul@2109|Sydney  |Hotel Sunshine|Standard    |1 - One   |26/09/2021 |28/09/2021  |2 - Two     |4 - Four    |Ram      |S       |NO 70A Chennai|4545343476864523|VISA            |June       |2022      |786  |