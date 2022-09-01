import React from 'react'
import ReactDOM from 'react-dom'
import Feature from '../src/homepageMain/main/Feature'


document.addEventListener('turbolinks:load', () => {
    ReactDOM.render(
    <Feature />,
    document.querySelector('#feature'))
})