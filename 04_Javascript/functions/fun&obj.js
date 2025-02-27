// Adding funcions to objects
person.name1 = function () {
  return this.firstName + " " + this.lastName;
};

person.name2 = function () {
  return (this.firstName + " " + this.lastName).toUpperCase();
};
//console.log(person.name1())
//console.log(person.name2())
console.log("name1 function definition: "+person.name1);
console.log("name2 function definition: "+person.name2);
/*
document.getElementById("demo").innerHTML = person;

document.getElementById("demo").innerHTML =
person.name + "," + person.age + "," + person.city;*/

// Removing function from the object

delete person.name1;