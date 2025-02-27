import React from 'react'
import ReactDOM from 'react-dom/client'

function Football () {
  const shoot = () => {
    alert('Great Shot!')
  }
  const ett = () => {
    alert('Great Shot!')
  }
  const input = () => {
    alert('input is given')
  }
  return (
    <div>
      <button onClick={shoot}>Take the shot!</button>
      <button onDoubleClick={ett}>Take the shot!</button>
      <button onPointerLeave={ett}>Take the shot!</button>
      <input type='text' onInputCapture={input}></input>
    </div>
  )
}

// const root = ReactDOM.createRoot(document.getElementById('root'))
// root.render(<Football />)
export default Football
