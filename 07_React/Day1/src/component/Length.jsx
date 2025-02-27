import React from 'react'
import ReactDOM from 'react-dom/client'

function Length (props) {
  const a = props.a
  return (
    <div>
      {a.length % 2 == 0 ? (
        <h3>{a} is even string</h3>
      ) : (
        <h3>{a} is odd string</h3>
      )}
    </div>
  )
}

export default Length
