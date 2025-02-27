// import React from 'react';

// function Tocheck(props){
//     const a = props.a || []
//     const b = ['Rose', 'Jasmine', 'Lotus']
//     for(flower : a)
// }


// function Array (props) {
//   const a = props.a || []
//   const flowers = ['Rose', 'Jasmine', 'Lotus']

//   let hasVowel = false
//   for (let char of a) {
//     if (flowers.includes(char)) {
//       hasVowel = true
//       break
//     }
//   }
//   return (
//     <div>
//       {hasVowel ? <h2>{a.toString()} </h2> : <h2> its not a flower </h2>}
//     </div>
//   )
// }

// export default Array
import { useState } from 'react'

function FlowerCheck () {
  const flowers = ['Rose', 'Jasmine', 'Lotus']
  const [input, setInput] = useState('')
  const [message, setMessage] = useState('')

  const checkFlower = () => {
    if (flowers.some(flower => flower.toLowerCase() === input.toLowerCase())) {
      setMessage("It's a flower.")
    } else {
      setMessage("It's not a flower.")
    }
  }

  return (
    <div style={{ textAlign: 'center', marginTop: '50px' }}>
      <h2>Flower Checker</h2>
      <input
        type='text'
        placeholder='Enter a flower name'
        value={input}
        onChange={e => setInput(e.target.value)}
        style={{ padding: '8px', marginRight: '10px' }}
      />
      <button onClick={checkFlower} style={{ padding: '8px' }}>
        Check
      </button>
      <p style={{ marginTop: '20px', fontWeight: 'bold' }}>{message}</p>
    </div>
  )
}
export default FlowerCheck