let student = {
  name: 'John Snow',
  age: 22,
  course: 'Information Technology',
  greet: function () {
    console.log('Hello, my name is ' + this.name)
  }
}

student.address = {
  city: 'New York',
  country: 'USA'
}

student.updateAge = function (newAge) {
  this.age = newAge
}
student.displayDetails = function () {
  console.log(
    this.name + ', ' + this.age + ', ' + this.course + ', ' + this.address.city
  )
}

student.greet()
student.updateAge(23)
student.displayDetails()

delete student.course
delete student.greet

console.log(student)
