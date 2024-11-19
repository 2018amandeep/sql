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