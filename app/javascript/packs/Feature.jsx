import React from "react";
import ReactDOM from "react-dom/client";
import Feature from '../src/homepage/Feature'

const feature = ReactDOM.createRoot(document.querySelector('#feature'));
feature.render(
    <React.StrictMode>
        <Feature />
    </React.StrictMode>
);

