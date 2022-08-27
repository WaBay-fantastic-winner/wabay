import React from 'react'
import Header from '../src/header/Header'
import Banner from '../src/main/Banner'
import Feature from '../src/main/Feature'
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
        </>    
    )
}

export default HomePage