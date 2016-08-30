<h1>VIZZY</h1>

VIZZY is designed to spark daily conversations by giving you a look at how your community feels about a given topic. 
It serves up the questions, questions are pulled from a spreadsheet to which questions can be added or removed at any time, and provides a real-time visualization of the responses received each day. The system runs on a Processing sketch with button input from an Arduino Leonardo.
<br>
<h2>Details:</h2>
A question will remain active until someone presses the “new question” button, explained below. 
This device does not require the internet, but if a user wants to add questions to the spreadsheet or have access to a saved visualization, the easiest way will be through a dropbox folder (which requires an internet connection). 
<br>
<br>
<b>How to engage with VIZZY:</b>
All questions are on a 1-5 scale. There are 5 “voting” buttons and each press counts toward a corresponding visualization on the screen. The more a button is pressed, the more that visualization changes. Each press registers one vote and no two buttons can be pressed at exactly the same time. Ideally each participant will vote once per visualization.
A 6th button on top of the kiosk, resets the question and visualization. If presses have been registered, the current visualization is saved into a preconfigured dropbox folder. 
Each image is named with a date and time: mm,dd,yy_hh,mm,ss. 
The buttons are controlled with an Arduino Leonardo, the code for which is included in this repository.
<br>
<br>
<b>Accessing, viewing and deleting the visualization screen captures:</b>
The easiest way to do this is via an internet synchronized Dropbox folder from any other computer, but can be done from the Dropbox folder on the host computer as well. The code is configured to send images to a folder called “saved_daily_images”.
<br>
<br>
<b>Adding a new question to the csv spreadsheet:</b>
The application pulls from a specifically named spreadsheet in a specific location. This spreadsheet can be synchronized via a dropbox folder that you can access from any computer (see dropbox instructions below). It’s OK to move or edit the spreadsheet in numbers, excel or google sheets, as long as it’s back in the correct location and with the same name when the application starts. Just make sure to EXPORT as a CSV and not another type of file. Do not leave blank white spaces between questions and avoid special punctuation including apostrophes! All questions should be in the rightmost column of the spreadsheet and not in any other column. The application displays whatever question is at the BOTTOM of the spreadsheet. When the “new question” button is pressed the current question is cycled to the top of the spreadsheet and every other question is moved down one row. There is no limit to the number of questions that can be included.
<br>
<br>
What if the community wants the screen captures to go straight to the web?
This is a great free tool for dropbox folder content into a website: https://www.smallvictori.es/
<br>
<br>
<h3>For more details about this project visit <a href="http://vizzyday.com">vizzyday.com</a>.</h3>
This project was created in the summer session at the <a href="http://72u.org">72u</a> residency in Los Angeles.
