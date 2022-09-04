import React from 'react'
import ReactDOM from 'react-dom'
import SearchPage from '../src/searchPage/searchPage'


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
    <SearchPage />,
    document.querySelector('#searchPage'))
})