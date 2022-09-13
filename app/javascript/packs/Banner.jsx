import React from "react";
import ReactDOM from "react-dom/client";
import Banner from '../src/homepage/Banner'

const banner = ReactDOM.createRoot(document.querySelector('#banner'));
banner.render(
    <React.StrictMode>
        <Banner />
    </React.StrictMode>
);

