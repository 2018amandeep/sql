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

console.log(functionN)

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

  function canSortArray(nums) {
    let preMx = 0;
    const n = nums.length;
    for (let i = 0; i < n; ) {
        const cnt = bitCount(nums[i]);
        let j = i + 1;
        let [mi, mx] = [nums[i], nums[i]];
        while (j < n && bitCount(nums[j]) === cnt) {
            mi = Math.min(mi, nums[j]);
            mx = Math.max(mx, nums[j]);
            j++;
        }
        if (preMx > mi) {
            return false;
        }
        preMx = mx;
        i = j;
    }
    return true;
}

function bitCount(i) {
    i = i - ((i >>> 1) & 0x55555555);
    i = (i & 0x33333333) + ((i >>> 2) & 0x33333333);
    i = (i + (i >>> 4)) & 0x0f0f0f0f;
    i = i + (i >>> 8);
    i = i + (i >>> 16);
    return i & 0x3f;
}

// Join two strings
// Concat

str1.concat(str2)

// Replace

let str1 = "Raj kundra"
str1.replace('Kundra', 'Kumar');  // It replace the first matching chatacter only
str1.replaceAll("\n", "\n"); // It will replace all matching chatacters
console.log(str1);

// CharAt

console.log(str1.charAt(0)); // It returns the character at given index

// Q. Generate a username based on full name

function generateUserName(fullName){
    return '@' + fullName.toLowerCase() + fullName.length;
}

// Arrays
// Collection of same type of data (linear)

let arr = [11, 12, 13, 14, 15]

typeof arr === 'object' // true because array is a object itself

// Arrays are mutable i.e., they can be modified
arr[0] =66;
// 125. Valid Palindrome

// Given two binary strings a and b, return their sum as a binary string.

// Iterables -> String, Array, Object

// Array Methods

// Push

let arr = [1, 2, 3, 4, 5]
arr.push("hello"); // change in last of existing array. return length of updated array
arr.pop(); // returns the deleted item -- 5

let stringArr = ["Name", "id", "class","division"]
stringArr.toString() // Name,id,class,division     return as string :  doesn't mutate original array it returns a new   

arr.concat(stringArr) // concat returns a new array

arr.unshift("the") // add in the starting of array 

arr.shift() // removes from beginning of array returns deleted item

arr.slice(0,3) // 1,2  return slice of array do not change original array it

// Splice -> mutate original array, (add, remove, replace)

let sliceArr = [1,2,3,4,5,6,7,8,9]

sliceArr.splice(2,2,a,b)  // it will mutate the original array as [1,2,a,b,5,6,7,8,9] and it will retun [3,4] i.e.,removed array
sliceArr.splice(2,3) // mutated in original array [1,2,6,7,8,9], output - 3,4,5\


// Q. Write a generator function that returns a generator object which yields the fibonacci sequence.

// The fibonacci sequence is defined by the relation Xn = Xn-1 + Xn-2.

// The first few numbers of the series are 0, 1, 1, 2, 3, 5, 8, 13.
// Generator function
var fibGenerator = function*() {
    let n1 = 0, n2 = 1;
    while(true){
        yield n1;
        let temp = n2;
        n2 = n1+n2;
        n1= temp;
    } 
};

// Can also be done as 
var fibGenerator = function*() {
    let n1 = 0, n2 = 1;

    while(true){
        yield n1;
        // let temp = n2;
        // n2 = n1+n2;
        // n1= temp;
        [n1, n2] = [n2, n1 +n2]
    }
};
// JS uses callback all the time
const high5 = (name)=> {
    console.log("Hi", name)
}

['Harry','Den','Prashad'].forEach(high5)

// Callback function allows us to create abstraction

//Objects methods

const lufthansa = {
    airline: 'Lufthansa',
    iataCode:'LH',
    bookings:[],
    book(flightNum, name){
        this.bookings.push({flight: `${this.iataCode}`, name})
        console.log(`${name} has booked flight ${flightNum} on ${this.iataCode}`)
    }
}

const eurorings = {
    airline:'Eurorings',
    iataCode:'ER',
    bookings:[],
}

const book = lufthansa.book;
book(23,'Amandeep')  // Here this will point to undefined because not book is a regular function expression

// Call method 
// manually set this keyword for any function call
// This method makes this keyword point to the required object

book.call(eurorings, 23, 'Sujju'); //Sujju has booked flight 23 on ER
book.call(lufthansa, 24, "Dev"); // Dev has booked flight 24 on LH

// Apply method
// Same as call method diff is it does not receive a list of aeguments it instead take array of arguments

book.apply(lufthansa,[256, 'John'])

// Bind method
// This doesn't immediately call the function instead it returns the new function which bound this keyword

const bookER = book.bind(eurorings);
bookER(34,'Steve Jobs')

// We can also give a default value to bind method

const bookER34 = book.bind(eurorings, 34);
bookER34('Sunita') // flightNum  = 34 is already assigned to flight eurowings

// Partiall Application -> it means part of argument of original function is already applied

const addTax = (rate, value) => value+ value * rate;
console.log(addTax(0.1,200))

// Partial Application
const vatTax = addTax.bind(null, 0.1);
console.log(vatTax(500))


// Closure

// A closure is a backback that a function carries around whereerver it goes. This backpack has all the variables that were present in the variable environment where the function was created.

function count(){
    let count =0;
    return function(){
        count++;
        console.log(count)
    }
}

const counter = count();
counter(); //1
counter(); //2

let f;

// Ex:1
function g(){
    const a=23;
    
    f= function(){
        console.log(a*2)
        return a*2;
    }
}
g()
f();

//Ex:2
function boardPassenger(n, wait){
    const perGroup = n/3;
    
    setTimeout(function(){
        console.log(`there are 3 groups, each with ${perGroup} members`);
    },wait*1000)
    
    console.log(`Timer has started after ${wait} seconds`)
}

boardPassenger(180,3)

console.dir(boardPassenger)

// Node js event emitter
const EventEmitter = require('events');

const ipl = new EventEmitter();

ipl.on('won', ()=>{
  console.log('KKR won the IPL')
})

ipl.on('loss', ()=> {
  console.log('SRH lost the IPL')
})


ipl.emit('won')

ipl.emit('loss')



