import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import Headers from './component/Header'
import Flower from './component/Flower'
import Course from './component/Course'
import Game from './component/Game'
import Animal from './component/Animal'
import Training from './component/Training'
import Football from './component/Football'
import IfCondition from './assets/IfCondition'
import LogicalCondition from './condition/LogicalCondition'
import TernaryCond from './condition/Ternarycond'
import Divisions from './condition/Divisible'
import Multipleof3 from './component/Multipleof3'
import Length from './component/Length'
import FlowerCheck from './Array/Tocheck'
import Mapping from './Mapping/MappingExample'
import { NumberDivisible } from './condition/Divisibleby16'
import { StudentList } from './component/StudentList'
import { AvailableCards } from './component/AvailableCards'
import './App.css'
import Demo from './Demo'

function App() {
  const [count, setCount] = useState(0)

  return (
    // <>
    //   <div>
    //     <a href="https://vite.dev" target="_blank">
    //       <img src={viteLogo} className="logo" alt="Vite logo" />
    //     </a>
    //     <a href="https://react.dev" target="_blank">
    //       <img src={reactLogo} className="logo react" alt="React logo" />
    //     </a>
    //   </div>
    //   <h1>Vite + React</h1>
    //   <div className="card">
    //     <button onClick={() => setCount((count) => count + 1)}>
    //       count is {count}
    //     </button>
    //     <p>
    //       Edit <code>src/App.jsx</code> and save to test HMR
    //     </p>
    //   </div>
    //   <p className="read-the-docs">
    //     Click on the Vite and React logos to learn more
    //   </p>
    // </>;
    <>
  <Headers />
  <Flower name='Gokul' />
  <Course name='Information Technology' />
  <Animal />
  <Game />
  <Training />
  <Football/>
  <IfCondition num={23} />
  <LogicalCondition/>
  <TernaryCond/>
  <Divisions></Divisions>
  <Multipleof3 a={[1,2,3,4,5,6]}></Multipleof3>
  <Length a="abc"/>
  <FlowerCheck/>
  <Mapping/>
  <NumberDivisible/>
  <StudentList/>
  <AvailableCards/>
  <Demo/>
  {/* {`${date} ${month} ${year}`} */}
</>

  )
}

export default App