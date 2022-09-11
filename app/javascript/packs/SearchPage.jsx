import React from "react";
import ReactDOM from "react-dom/client";
import SearchPage from '../src/searchPage/SearchPage'

const searchPage = ReactDOM.createRoot(document.querySelector('#searchPage'));
searchPage.render(
    <React.StrictMode>
        <SearchPage />
    </React.StrictMode>
);