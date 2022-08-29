import React from 'react'
import ReactDOM from 'react-dom'
import HomePage from '../src/page/HomePage'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <HomePage />,
    document.body.insertAdjacentElement('afterbegin',document.createElement('div')),
  )
})