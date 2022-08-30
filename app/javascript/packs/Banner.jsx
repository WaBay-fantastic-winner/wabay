import React from 'react'
import ReactDOM from 'react-dom'
import Banner from '../src/homepageMain/main/Banner'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
    <Banner />,
    document.querySelector('#banner'))
})