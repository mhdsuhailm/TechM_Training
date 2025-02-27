//8. Get the price of 1 kg tomato from Monday to Sunday, find its average. If the average is greater than Rs.50, then display, tomato has given good profit. If not, display "No profit from tomato".

let prices = [3000,35,40,45,20,25,30,]
// for (let i = 0; i < 7; i++) {
//   let price = Number(prompt(`Enter the price of 1kg tomato for day ${i + 1}:`))
//   prices.push(price)
// }

// Calculate average price
let sum = prices.reduce((acc, curr) => acc + curr, 0)
let avgPrice = sum / 7

if (avgPrice > 50) {
  console.log('Tomato has given good profit.')
} else {
  console.log('No profit from tomato.')
}
