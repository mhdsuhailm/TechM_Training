//15.Get 2 numbers with interval 50. For example 10,60. Display the values from 10 to 60, but skip displaying the multiples of 5.

// let num1 =10;
// let num2 = 60;

// // let num = num2
// while (num1 <= num2) {
//   if (num1 % 5 == 0) {
//     continue;
//   }
//   console.log(num1)
//   num1++;
// }
let start = 10
let end = start + 50

let num = start
while (num <= end) {
  if (num % 5 === 0) {
    num++
    continue
  }
  console.log(num)
  num++
}
