const { useState } = React

// function Counter () {
//   const [count, setCount] = useState(0)

//   return <button onClick={() => setCount(count + 1)}>Count: {count}</button>
// }
// import { useState } from "react"
const Counter = () => {
  const [count, setCount] = useState(0)
  return (
    <div className='flex flex-col item-center justify-center'>
      <button className='' onClick={() => setCount(count + 1)}>
        Increment
      </button>
      <button onClick={() => setCount(count - 1)}>Decrement</button>
      <button onClick={() => setCount(0)}>reset</button>
      <div className="flex  item-center justify-center">{count}</div>

    </div>
  )
}
// function Counter () {
//   const [count, setCount] = useState(0)

//   return <button onClick={() => setCount(count + 1)}>Count: {count}</button>
// }

const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(<Counter />)
