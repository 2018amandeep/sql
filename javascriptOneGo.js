// Functions

// Function declaration

function greet(name) {
    return `Hello ${name}`
}

// Function invocation
greet('Aman');

// Function Expression

let functionN = function(name){  // address of function has been passed to the variable functionN
    return `Hello ${name}`
}

console.lof(functionN)

//IIFE - Immediately Invoke Function Expression

(function fn(name){
    return `Hello ${name}`
})();

// Loops
//Loops are uses to execute a piece of code again and again

for(let i=0;i<navigator;i++){}

// For-of-loop
// Loops in arrays and strings

for(let val of valString){
    //iterate over string or array
}

// For-in-loop
// Used for iterating over objects and arrays 

let strudent = {
    name: 'John',
    age: 20,
    class: 'inter',
    village:'Rohtak'
}

for(let key in student){
    // iterate over object properties\
    console.log(key, student[key]) // key and value of key
}

// Strings in js
 //String is a sequence of characters which are used ot refer text

 // Template literals
 // A way to have embedded expressions in strings
 ` this is template literals`

 // String Interpolation
 //To create string by doing substitution of placeholders
 ` string ${placeholder} interpolation`
 ` string ${1+2+3*4/5  } interpolation`

 // Escape characters -> Provies next line in string
  //  \n
  console.log('Amandeep \n Prajapati')

  // Tab space -> \t escape characters are count as single string

  // String methods -> built-in functions to manipulate strings

  strudent.toUppercase();
  strudent.toLowerCase();
  strudent.trim(); // removes white spaces 

  // These methods to not modify original string they creates a new modified string because in javascript strings are immutable

  strudent.slice(start, end) // ending values are non-inclusive means it returns value till end -1
