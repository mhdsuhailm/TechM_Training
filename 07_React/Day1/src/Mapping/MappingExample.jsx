function Mapping () {
  return (
    <div>
      <h2>1 . Mapping Strings </h2>
      {mapString()}
      <h2>2 . Mapping objects </h2>
      {mapObject()}
      <h2>3 . conditional Mapping </h2>
      {mapCondition()}
      <h2>3 . component Mapping </h2>
      {mapComponent()}
    </div>
  )
}

function mapString () {
  const Fruits = ['apple', 'bannan', 'strwberry', 'mango']
  return (
    <div>
      {Fruits.map((Fruit, index) => (
        <li key={index}>{Fruit}</li>
      ))}
    </div>
  )
}

function mapObject () {
  const Persons = [
    { id: 1, name: 'jhon', age: 24 },
    { id: 2, name: 'snow', age: 24 }
  ]
  return (
    <div>
      {Persons.map(person => (
        <p key={person.id}>
          {person.name} is {person.age} old
        </p>
      ))}
    </div>
  )
}

function mapCondition () {
  const Numbers = [1, 2, 3, 4, 5, 6]
  return (
    <ul>
      {Numbers.filter(num => num % 2 === 0).map(num => (
        // <li key={num}>{num}</li>
        <p key={num}>{num}</p>
      ))}
    </ul>
  )
}

function mapComponent () {
  const Product = [
    { id: 1, name: 'laptop', price: 12345 },
    { id: 2, name: 'mouse', price: 123 }
  ]
  return (
    <div>
      {Product.map(product => (
        <ProductItems key={product.id} product={product} />
      ))}
    </div>
  )
}
function ProductItems ({ product }) {
  return (
    <div>
      <h3>{product.name}</h3>
      <h3>{product.price}</h3>
    </div>
  )
}
export default Mapping
