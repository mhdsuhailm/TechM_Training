//1. Create 3 div elements in a html file. Render h2 in a div, h4 tag in a div and p in a div using ReactDom

//2. Create a component called Flower using functions with props as name with value "Rose"

//3. Create a component called course using class with props as name with value "Information Technology"

//4. Create a Animal component using function

//5. Create a component called Game using class
//6. Create a component called Training . Create the components for Java, Javascript, React and Angular and have them inside the Training component. Display their details in a html page with heading as "Topics for Traning".

// import React from 'react'

const Java = () => <p>i'm Java</p>
const Javascript = () => <p>i'm Javascript</p>
const React = () => <p>i'm React</p>
const Angular = () => <p>i'm Angular</p>

const Training = () => {
  return (
    <div>
      <h1>Topics For Training</h1>
      <Java></Java>
      <Angular />
      <Javascript/>
      <React/>
    </div>
  )
}
export default Training;