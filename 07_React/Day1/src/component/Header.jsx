import React from 'react';
import {v4} from 'uuid';

const Header = () => {

  return (
    <>
      <div>
        <h2>This is an H2 heading</h2>
      </div>
      <div>
        <h4>This is an H4 heading</h4>
      </div>
      <div>
        <p>This is a paragraph</p>
      </div>
      <h1>unique id:</h1>
      <p>{v4()}</p>

    </>
  )
}

export default Header
