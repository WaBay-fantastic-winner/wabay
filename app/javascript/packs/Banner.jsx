import React from 'react'
import ReactDOM from 'react-dom'
import Banner from '../src/homepage/Banner'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
    <Banner />,
    document.querySelector('#banner'))
})

// import React from "react";
// import ReactDOM from "react-dom/client";
// import "./index.css";
// import Banner from '../src/homepage/Banner'
// import reportWebVitals from "./reportWebVitals";

// const banner = ReactDOM.createRoot(document.querySelector('#banner'));
// banner.render(
//     <React.StrictMode>
//         <Banner />
//     </React.StrictMode>
// );

// reportWebVitals();