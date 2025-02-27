import React from 'react'

class Course extends React.Component {
  render () {
    return <h3>Course Name: {this.props.name}</h3>
  }
}

export default Course
