//13. Get 2 numbers. Have the third number as second number + 40. Using while loop, display the multiples of first number from second number to third number. For example , if the numbers are 7, 20, first number is 7, second number is 20 and third number is 20+40, which is 60. So, Multiples of 7 should be displayed from 20 to 60, using while loop

let firstNumber = 7 
let secondNumber = 20 
let thirdNumber = secondNumber + 40 

let num = secondNumber
while (num <= thirdNumber) {
  if (num % firstNumber === 0) {
    console.log(num)
  }
  num++
}
