// Ternary Operator

import React from 'react'
import ReactDOM from 'react-dom/client'

function EvenNumber () {
  return <h1>EvenNumber!</h1>
}

function OddNumber () {
  return <h1>OddNumber!</h1>
}
function TernaryCond (props) {
  const isNum = props.num
  return <>{isNum % 2 == 0 ? <EvenNumber /> : <OddNumber />}</>
}

export default TernaryCond;