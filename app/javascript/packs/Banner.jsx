import React from 'react'
import ReactDOM from 'react-dom'
import Banner from '../src/homepage/Banner'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
    <Banner />,
    document.querySelector('#banner'))
})