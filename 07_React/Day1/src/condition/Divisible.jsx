// const Divisible = (props) =>{
    
//         if(props % 13 == 0){
            
//         }return(

//         )
    
// }
import React from 'react'
import ReactDOM from 'react-dom/client'

function Divisions (props) {
  const num = props.num
  return (
    <div>
      {num % 13 == 0 ? (
        <h1>{num} is divisible by 13</h1>
      ) : (
        <h1>{num} not divisible by 13</h1>
      )}
    </div>
  )
}

export default Divisions
