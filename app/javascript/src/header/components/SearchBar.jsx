import React,{ useState } from 'react';
import { FaSearch, FaTimesCircle } from 'react-icons/fa';

const Search = () => {

    const [active, setActive] = useState("hidden")
    const searchbarToggle = () => {
        active === 'hidden' ? setActive('block') : setActive('hidden')
    }

    return (
        <div className="flex items-center pr-5 search lg:pr-2">
            <button className="flex search-btn " onClick={searchbarToggle}>
                <span className="hidden lg:inline">搜尋</span> 
                <FaSearch className="inline-block pl-2 text-2xl "/>
            </button>
            <div className={`search-form ${active} absolute z-10 inset-0 px-14 lg:px-28 bg-white`}>
                <div className="flex items-center h-full">
                    <FaSearch className="inline-block mr-2"/>
                    <form className="flex-1" action="/projects" method='get'>
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

