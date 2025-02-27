//3. Create a variable as const, check if its a prime number or not, and display the result accordingly/
const primeNum = 7 

function isPrime (n) {
  if (n < 2) return false
  for (let i = 2; i <= Math.sqrt(n); i++) {
    if (n % i === 0) return false
  }
  return true
}

if (isPrime(primeNum)) {
  console.log(`${primeNum} is a Prime Number`)
} else {
  console.log(`${primeNum} is NOT a Prime Number`)
}
