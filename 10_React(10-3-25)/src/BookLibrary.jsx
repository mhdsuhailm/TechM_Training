import React, { useState, useEffect } from 'react'
import BookList from './Booklist'

const BookLibrary = () => {
  const [books, setBooks] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    fetch('http://localhost:5000/books')
      .then(res => {
        if (!res.ok) {
          throw new Error('Failed to fetch books')
        }
        return res.json()
      })
      .then(data => {
        setBooks(data)
        setLoading(false)
      })
      .catch(err => {
        console.error('Error fetching books:', err)
        setError(err.message)
        setLoading(false)
      })
  }, [])

  if (loading) {
    return <div className='container mt-3'>Loading...</div>
  }

  if (error) {
    return <div className='container mt-3'>Error: {error}</div>
  }

  if (books.length === 0) {
    return <div className='container mt-3'>No books found.</div>
  }

  return (
    <div className='container mt-3'>
      <h3>Recommended Books</h3>
      <BookList books={books} />
    </div>
  )
}

export default BookLibrary
