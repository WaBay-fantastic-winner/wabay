import React,{ useState } from 'react';
import { FaSearch, FaTimesCircle } from 'react-icons/fa';
import SearchTest from '../unit_test/SearchTest';
import { searchAPI } from '../../API/request';
import axios from "axios"; 


const Search = ({ setSearchResult }) => {

    const [active, setActive] = useState("hidden")
    const searchbarToggle = () => {
        active === 'hidden' ? setActive('block') : setActive('hidden')
    }

    const searchAPI = () => {
        axios.get(`http://127.0.0.1:3000/projects/search`)
            .then(res =>{setSearchResult(res.data);})
    }

    
    return (
            <div className="search pr-2 flex items-center">
                <button className="search-btn flex mr-2" onClick={searchbarToggle}>
                    <span className="hidden lg:inline">搜尋</span> 
                    <FaSearch className="pl-2 inline-block text-2xl"/>
                </button>
                <div className={`search-form ${active} absolute inset-0 px-28 bg-white`}>
                    <div className="flex items-center h-full">
                        <FaSearch className="inline-block mr-2"/>
                        <form className="flex-1" action="/projects/search" method='get' onSubmit={searchAPI}>
                            <input id="search-input" className="w-full focus:outline-none" type="text" placeholder="搜尋" name="keyword"/>
                        </form>
                        <button className="close-btn" onClick={searchbarToggle}>
                            <FaTimesCircle />
                        </button>
                    </div>
                </div>
            </div>  
    )
}

export default Search

