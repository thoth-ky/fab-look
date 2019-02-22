import React from 'react';

export const DisplayErrors = (messages) => {
  const { errors } = messages
  const errorNode = errors.map((error, index) => (
      <li key={index}>{error}</li>      
  ))
  return (
    <ul className="errors list-erros">
      { errorNode }
    </ul>
  )
}