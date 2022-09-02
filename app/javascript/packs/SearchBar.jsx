import React from 'react'
import ReactDOM from 'react-dom'
import SearchBar from '../src/header/components/SearchBar'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
    <SearchBar />,
    document.querySelector('#searchBar'))
})