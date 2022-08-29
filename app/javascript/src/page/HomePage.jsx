import React, { useState } from 'react'
import Footer from '../footer/Footer'
import Header from '../header/Header'
import Banner from '../homepageMain/main/Banner'
import Feature from '../homepageMain/main/Feature'
import Propose from '../homepageMain/main/Propose'
import Recommendation from '../homepageMain/main/Recommendation'
import TheNewest from '../homepageMain/main/TheNewest'

const HomePage = () => {
    const [searchResult, setSearchResult] = useState(null)
    return (
        <>
            <Header setSearchResult={setSearchResult} />
            <Banner />
            <Recommendation />
            <TheNewest />
            <Feature />
            <Propose/>
            {/* <SearchPage searchResult={searchResult}  /> */}
            <Footer/>
        </>    
    )
}

export default HomePage