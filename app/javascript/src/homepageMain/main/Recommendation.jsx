import React from 'react'
import FundraisingItem from "./components/FundraisingItem"

const Recommendation = () => {
    return(
        <section className="bg-gray-100 pt-8 px-10">
            <div className="max-w-6xl mx-auto flex items-end mb-4">
                <h2 className="mx-5 text-3xl font-extrabold">平台推薦</h2>
                <a className="text-blue-400" href="">More</a>
            </div>
            <div className="mx-auto max-w-6xl md:flex ">
                <FundraisingItem/>
                <FundraisingItem/>
                <FundraisingItem/>
            </div>
        </section>
    )
}

export default Recommendation