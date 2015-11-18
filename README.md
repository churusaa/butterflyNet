# butterflyNet
A Bash built "butterfly net" for catching files that appear briefly before 
being removed.


The three configurable variables right now are file name, folder path, and 
duration (how long the script runs before timing out).

fileName should be a string (enclosed in quotes)

pathToWatch should be a string (enclosed in quotes) and should include the 
trailing slash "/". It can be an absolute or relative path, but it should 
ideally be set to an absolute path.

minutes is an integer or floating point number and (you guessed it) represents 
how long the script will look before exiting. I may make scan frequency 
configurable later, but hopefully I have written this script clearly enough 
that the intrepid will be able to tell how I'm working out the timeout period.

butterflyNet.sh will find any file ending with the string of characters 
specified, which is useful in situations where a program is uploading a script 
for you as part of a task. This can ignore any UID strings preceding your file 
name when uploaded.
