// 4. Create a arrow function without parameters, to choose the operation among add, subtract, multiply and divide, using switch statement.
// On choosing the operation, it has to invoke the corresponding method (as expression) with parameters and display the results accordingly, like, sum for add, difference for subtract, product for multiply, quotient and reminder for divide

// const chooseopp = () => {
//     let operation = "multiply"
//     let num1 = 12;
//     let num2 = 13;

//     switch(operation){
//         case "add":
//             console.log("sum of numbers " + num1+num2);
//             break;
//         case "subtraction":
//             console.log("diff of two numbers " + num1-num2);
//             break;
//         case "multiply":
//             console.log("multiply of two numbers " + num1*num2);
//             break;
//         case "divide":
//             console.log("division of two numbers " + num1%num2+ "quotient of two numbers " + num1/num2);
        
        
//     }
// }
// chooseopp()
const chooseOperation = () => {
  const add = (a, b) => a + b
  const subtract = (a, b) => a - b
  const multiply = (a, b) => a * b
  const divide = (a, b) =>
    b !== 0
      ? `Quotient: ${Math.floor(a / b)}, Remainder: ${a % b}`
      : 'Cannot divide by zero'

  let operation = 'add'
  let a = 10,
    b = 5

  switch (operation) {
    case 'add':
      console.log(`Sum: ${add(a, b)}`)
      break
    case 'subtract':
      console.log(`Difference: ${subtract(a, b)}`)
      break
    case 'multiply':
      console.log(`Product: ${multiply(a, b)}`)
      break
    case 'divide':
      console.log(divide(a, b))
      break
    default:
      console.log('Invalid operation')
  }
}

chooseOperation()
