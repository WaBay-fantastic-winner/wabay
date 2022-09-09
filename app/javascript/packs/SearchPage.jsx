import React from 'react'
import ReactDOM from 'react-dom'
import SearchPage from '../src/searchPage/SearchPage'


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
    <SearchPage />,
    document.querySelector('#searchPage'))
})