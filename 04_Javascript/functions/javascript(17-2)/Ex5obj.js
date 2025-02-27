// 5. Create a object called student with properties id, name, department, college and email.Write a function to access the properties and display them. Invoke the function to display the details
// Write another function to access the properties id, name and email and display them. Invoke the function to display the details
// Add a property called address, as another object, with properties as doorNo, street, area and pincode
// Add a function to display the details of the student with address.
// Delete the property email and the function created to display id, name and email.

let student = {
  id: 101,
  name: 'jhon snow',
  department: 'war',
  college: 'panimalar institute of technology',
  email: 'jhon@gmail.com'
}

function displaystu () {
  console.log('Student Details')
  console.log('Student id: ' + student.id)
  console.log('Student name: ' + student.name)
  console.log('Student department: ' + student.department)
  console.log('Student college: ' + student.college)
  console.log(`student Email: ${student.email}`)
}
displaystu()

function displaybasicstu () {
  console.log('Basic Details')
  console.log('Student id: ' + student.id)
  console.log('Student name: ' + student.name)
  console.log(`student Email: ${student.email}`)
}
displaybasicstu()

student.address = {
  doorNo: '12B',
  street: 'Main Road',
  area: 'Chennai',
  pincode: 600001
}
const displayStudentWithAddress = () => {
  console.log('\nStudent Details with Address:')
  console.log(`ID: ${student.id}`)
  console.log(`Name: ${student.name}`)
  console.log(`Department: ${student.department}`)
  console.log(`College: ${student.college}`)
  console.log(
    `Address: ${student.address.doorNo}, ${student.address.street}, ${student.address.area} - ${student.address.pincode}`
  )
}

displayStudentWithAddress();

delete student.email;
delete displaybasicstu;
// displaybasicstu()

console.log("after deleting email and basic function");
console.log(student)



