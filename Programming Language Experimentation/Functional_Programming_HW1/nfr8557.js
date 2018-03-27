/*
    Nima Rahimzadeh
    1000988557
    Thursday, 5 October 2017
*/

/*
    Some comments will be labeled with which question they are related to, in the following fashion
    (P1a) for problem 1 part a, (P2) for problem 2, etc...
*/

//Program Start

var table = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; //Creating array (P1)

var getScaledArray = (array, mult)=>array.map((x)=>x*mult); //Takes an array and multiplier, then returns an array with each input array value multiplied by the multiplier

var getSquaredArray = (array)=>array.map((x)=>x*x); //Takes an array as a parameter, then returns an array with each input array value squared

var cylinder_volume = (r)=>(h)=>(3.14*r*r*h);   //curried cylinder_volume function from P5. Takes parameter r, then takes h, then returns the two parameters plugged into the volume formula. Eliminated variable declarations, eliminated variable revaluing and curried the function. (P5)

makeTag = function(beginTag, endTag){           //copied function from P6
    return function(textcontent){               //--
        return beginTag +textcontent +endTag;   //--
    }                                           //--
}                                               //--

fiveTable = getScaledArray(table, 5);  //Calls the function variable "getScaledArray" with parameters table and 5, then stores the returned array into an array named fiveTable (P2a)
console.log("fivesTable: " + fiveTable); //Prints table for P1a into the console

tenTable = getScaledArray(table, 10); //Calls the function variable "getScaledArray" with parameters table and 10, then stores the returned array into an array named tenTable (P2b)
console.log("tenTable: " + tenTable); //Prints table for P1b into the console

squaresTable = getSquaredArray(table); //Calls the function variable "getSquaredArray" with parameter table, then stores the returned array into an array named squaresTable (P2c)
console.log("squaresTable: " + squaresTable);//Prints table for P1c into the console

console.log("Odd Fives Table: " + getScaledArray([1,3,5,7,9,11,13,15,17,19], 5)); //Prints the return of getScaled array when given an array of all odd numbers between 1 and 20, and a multiplier of 5 (P3)

console.log("Even Sevens Table: " + getScaledArray([1, 2,4,6,8,10,12,14], 7)); //Prints the return of getScaled array when given an array of all even numbers between 1 and 14, and a multiplier of 7 (P4)

console.log("Cylinder Volume: " + cylinder_volume(5)(10)); //Prints out the return of curried function "cylinder_volume" with parameter 5 given as r, and then 10 given as h. (P5)

console.log("HTML table: " + makeTag("<", ">")("Element 1 | Element 2 | Element 3 | Element 4 | Element 5")); //Made a table enclosed in <> to show that you can take advantage of closure in a curried function. (instructions quite vague) (P6)