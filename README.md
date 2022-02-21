# Course Progress Tracker
## Project Description
A project that uses *Python* to query a database using *SQL* to retrive data on a student's course progress. *SQL* was used to collect neccessary data for the type of querying the user requests and *Python* was used to colate this data, along with some logic to account for the course rules, and display the results.</br>
Upon starting this project, I didn't take the time to come up with a plan which cause for some road-blocks in the later stages of the project. Through this, I've learnt the importance if planning before hand and adapting to the situation afterwards.

## How to run the project
You will have to download this repository as a zip file to your system.

Unzip the file and open a terminal at the file location. 

The database is not available, so you will have to make a database using the schema provided in this repository as the file (Data Model and Schema.pdf).

To use the *transcript* run 
```shell
./transcript zID
```
where the *zID* is a 7 number sequence starting with 5.

To use *rules* run
```shell
./rules [courseCode|streamCode]
```

To use *progress* run
```shell
./progress zID [courseCode] [streamCode]
```
where courseCode and streamCode can be left out.

