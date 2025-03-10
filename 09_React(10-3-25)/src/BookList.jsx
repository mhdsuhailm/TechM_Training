import React from 'react'

const BookList = ({ books }) => {
  if (!books || books.length === 0) {
    return <div className='text-center'>No books available.</div>
  }

  const handleCardClick = link => {
    window.open(link, '_blank') // Open the link in a new tab
  }

  return (
    <div className='row'>
      {books.map((book, index) => (
        <div key={index} className='col-md-4 mb-4'>
          <div
            className='card h-100 shadow-sm'
            style={{ cursor: 'pointer' }}
            onClick={() => handleCardClick(book.link)}
          >
            <img
              src={book.image}
              alt={book.title}
              className='card-img-top'
              style={{ height: '300px', objectFit: 'cover' }}
            />
            <div className='card-body'>
              <h5 className='card-title'>{book.title}</h5>
              <h6 className='card-subtitle mb-2 text-muted'>{book.author}</h6>
              <p className='card-text'>{book.description}</p>
              <span className='badge bg-primary'>{book.genre}</span>
            </div>
          </div>
        </div>
      ))}
    </div>
  )
}

export default BookList
