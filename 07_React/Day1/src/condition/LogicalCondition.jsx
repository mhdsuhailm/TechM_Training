// Logical && conditionals

import React from 'react';
import ReactDOM from 'react-dom/client';

function LogicalCondition(props) {
  const friends = ['ABCD', 'MDA', 'SP', 'ABR'];
  const friendss = [];
  return (
    <>
      <h1>About Friends!!</h1>
      { friends.length > 0 &&
        <h2>
          You have {friends.length} friends for you!!!
        </h2>
      }
         <h3>You have no friends for you!!!</h3>
    </>
  );
}

export default LogicalCondition;