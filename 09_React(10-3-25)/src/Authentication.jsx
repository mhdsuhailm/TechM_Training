import React, { useState, useEffect } from 'react'

const Authentication = ({ setUser }) => {
  const [users, setUsers] = useState([])
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [isRegister, setIsRegister] = useState(false)

  useEffect(() => {
    fetch('http://localhost:5000/users')
      .then(res => res.json())
      .then(data => setUsers(data))
      .catch(err => console.error('Error fetching users:', err))
  }, [])

  const handleLogin = e => {
    e.preventDefault()
    const user = users.find(u => u.email === email && u.password === password)
    if (user) {
      setUser(user)
    } else {
      alert('Invalid credentials')
    }
  }

  const handleRegister = e => {
    e.preventDefault()
    if (users.find(u => u.email === email)) {
      alert('User already exists')
      return
    }
    const newUser = { email, password }

    fetch('http://localhost:5000/users', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(newUser)
    })
      .then(res => res.json())
      .then(data => setUsers([...users, data]))
      .catch(err => console.error('Error adding user:', err))

    alert('Registration successful. Please login.')
    setIsRegister(false)
  }

  return (
    <div className='m-auto'>
      <form onSubmit={isRegister ? handleRegister : handleLogin}>
        <div className='mb-3'>
          <label className='form-label'>Email</label>
          <input
            type='email'
            className='form-control'
            value={email}
            onChange={e => setEmail(e.target.value)}
            required
          />
        </div>
        <div className='mb-3'>
          <label className='form-label'>Password</label>
          <input
            type='password'
            className='form-control'
            value={password}
            onChange={e => setPassword(e.target.value)}
            required
          />
        </div>
        <button type='submit' className='btn btn-primary w-100'>
          {isRegister ? 'Register' : 'Login'}
        </button>
        <p className='mt-2 text-center'>
          {isRegister ? 'Already have an account?' : "Don't have an account?"}{' '}
          <span
            className='text-primary'
            style={{ cursor: 'pointer' }}
            onClick={() => setIsRegister(!isRegister)}
          >
            {isRegister ? 'Login' : 'Register'}
          </span>
        </p>
      </form>
    </div>
  )
}

export default Authentication
