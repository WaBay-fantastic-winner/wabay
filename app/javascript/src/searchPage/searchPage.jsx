import React from 'react'
import Select from './components/Select'
import FundraisingItem from "./components/FundraisingItem"
import axios from '../../lib/http/client'

const Recommendation = () => {
    
    axios.get('/projects.json')
        .then(resp => console.log(resp.data))
        .catch( err => console.log(err))
    return(
        <section className="p-8 mx-auto max-w-6xl">
            <div className='my-5'>
                <Select />
            </div>
            <div className="grid md:grid-cols-9 gap-5">
                <FundraisingItem/>
                <FundraisingItem/>
                <FundraisingItem/>
            </div>
        </section>
    )
}

export default Recommendation