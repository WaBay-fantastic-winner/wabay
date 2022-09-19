import React from 'react'
import Select from './components/DropDownList'
import FundraisingItem from "./components/FundraisingItem"


const SearchPage = () => {
    return(
        <section className="max-w-6xl p-8 mx-auto">
            <div className='my-5'>
                <Select />
            </div>
            <div className="grid gap-5 md:grid-cols-9">
                <FundraisingItem/>
            </div>
        </section>
    )
}

export default SearchPage