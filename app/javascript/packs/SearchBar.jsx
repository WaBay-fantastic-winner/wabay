import React from 'react'
import ReactDOM from 'react-dom'
import SearchBar from '../src/header/components/SearchBar'

document.addEventListener('turbolinks:load', () => {
    ReactDOM.render(
    <SearchBar />,
    document.querySelector('#searchBar'))
})