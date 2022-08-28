import React from 'react'
import Header from '../src/header/Header'
import Banner from '../src/main/Banner'
import Feature from '../src/main/Feature'
import Propose from '../src/main/Propose'
import Recommendation from '../src/main/Recommendation'
import TheNewest from '../src/main/TheNewest'

const HomePage = () => {
    return (
        <>
            <Header />
            <Banner />
            <Recommendation />
            <TheNewest />
            <Feature />
            <Propose/>
        </>    
    )
}

export default HomePage