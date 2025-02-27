// if statement
const num = 5

if (num > 0) {
  console.log('The number is positive.')
}

//if - else statement
let num1 = -10

if (num1 > 0) console.log('The number is positive.')
else console.log('The number is negative')

//nested if
let weather = 'sunny'
let temperature = 25

if (weather === 'sunny') {
  if (temperature > 30) {
    console.log("It's a hot day!")
  } else if (temperature > 20) {
    console.log("It's a warm day.")
  } else {
    console.log("It's a bit cool today.")
  }
} else if (weather === 'rainy') {
  console.log("Don't forget your umbrella!")
} else {
  console.log('Check the weather forecast!')
}

//If-Else-If Statement
const temp = 25;
if (temp > 30) {
    console.log("It's hot.");
} else if (temp >= 20) {
    console.log("It's warm.");
} else {
    console.log("It's cold.");
}

let name = prompt('Enter your name:')
console.log('Hello, ' + name)

// switch statement
let num2 = 5

switch (num2) {
  case 0:
    console.log('Number is zero.')
    break
  case 1:
    console.log('Nuber is one.')
    break
  case 2:
    console.log('Number is two.')
    break
  default:
    console.log('Number is greater than 2.')
}

//Using the Ternary Operator (Conditional Operator)

let num3 = 10;

let result = num3 >= 0 ? "Positive" : "Negative";

console.log(`The number is ${result}.`);

//for loop

for (let i = 21; i <= 40; i++) {
  if (i % 2 === 0) {
    console.log(i);
  }
};

//while loop
let i = 11;
while (i <= 15) {
    console.log(i);
    i++;
}

//do while loop
let j = 21;
do {
    if(j%4==0)
    console.log(i);
    j++;
} while (j <= 35);

//return statement
function add(a, b) {
    return a + b;
}
const res = add(55, 63);
console.log(res);

//break and continue statement
for (let i = 1; i <= 5; i++) {
    if (i === 3) break;
    console.log(i);
}

for (let i = 1; i <= 5; i++) {
    if (i === 3) continue;
    console.log(i);
}
