import React, { useState } from 'react'
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate
} from 'react-router-dom'
import 'bootstrap/dist/css/bootstrap.min.css' // Import Bootstrap CSS
import './App.css' // Import custom CSS
import BookLibrary from './BookLibrary'
import Authentication from './Authentication'

const App = () => {
  const [user, setUser] = useState(null)

  return (
    <Router>
      <div className='d-flex justify-content-center align-items-center min-vh-100'>
        <div className='content-container'>
          <h2 className='text-center'>Book Library</h2>
          <Routes>
            <Route
              path='/'
              element={
                !user ? (
                  <Authentication setUser={setUser} />
                ) : (
                  <Navigate to='/books' />
                )
              }
            />
            <Route
              path='/books'
              element={user ? <BookLibrary /> : <Navigate to='/' />}
            />
          </Routes>
        </div>
      </div>
    </Router>
  )
}

export default App
