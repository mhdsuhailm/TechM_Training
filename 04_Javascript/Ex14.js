//14.Get 2 numbers with interval 30. For example 10,40. Display the values from 10 to 40, and stop displaying if any multiple of 7 comes.

let num1 = 10;
let num2 = 40;

let num = num2;
while( num1 <= num){
    if(num1 %7 == 0){
        break;
    }
    console.log(num1);
    num1++
}