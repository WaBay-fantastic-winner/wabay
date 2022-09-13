import React from "react";
import ReactDOM from "react-dom/client";
import SearchBar from '../src/header/components/SearchBar'

const searchBar = ReactDOM.createRoot(document.querySelector('#searchBar'));
searchBar.render(
    <React.StrictMode>
        <SearchBar />
    </React.StrictMode>
);
