// import AB4_React from './components/AB4_React'
// const ABComponent2 = React.lazy(() => import('./AB2_React'))
// const ABComponent3 = React.lazy(() => import('./components/AB3_React'))
import React from 'react'
import { Suspense } from 'react'
import Header from './component/Header'
const Animal = React.lazy(() => import('./component/Animal'))
const Course = React.lazy(() => import('./component/Course'))

function Demo () {
  return (
    <div>
      <h1>Welcome to ReactApp with Vite and AB1_React!!!</h1>
       <Header/>
        <Animal/>
      <Suspense fallback={<h1>Loading...</h1>}>
        {/* <ABComponent2 />
        <ABComponent3 />
        <AB4_React /> */}
       
        <Course/>
      </Suspense>
    </div>
  )
}

export default Demo
