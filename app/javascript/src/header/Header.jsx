import React from 'react';
import { FiUser } from 'react-icons/fi';
import './header.css'
import MobileNav from './components/MobileNav';
import Search from './components/SearchBar';
import Member from './components/Member';

const Header = () => {
    return (
    <div className='header'>
        <header className="text-lg relative w-full border-b text-slate-500 border-gray-200 ">
            <nav className="header-item h-fit flex justify-between items-center max-w-6xl mx-auto">
                <div className="header-webnav">
                    <ul className="hidden lg:flex ">
                        <li><a className="px-5" href="">首頁</a></li>
                        <li><a className="px-5" href="">探索</a></li>
                        <li><a className="px-5" href="">提案</a></li>
                    </ul>
                    {/* <!-- 手機側邊收縮導覽列 --> */}
                    <MobileNav />
                </div>
                {/* <!-- LOGO --> */}
                <div className="logo w-72 absolute right-1/2 transform translate-x-1/2">
                    <a href=""><img className="object-cover" src={require('../../assets/img/wubayLogo.png')} alt="logo" /></a>
                </div>
                <div className="header-left flex ">
                    {/* <!-- 搜尋相關  --> */}
                    <Search/>
                    {/* <!-- 會員相關  --> */}
                    {/* <Member/> */}
                    <div className="member flex mr-5">
                        <div className="not-logging hidden lg:inline-block text-blue-400">
                            <a className="p-5 mr-2" href="/users/sign_in">登入</a>
                            <a className="px-5 py-3 rounded-md border border-blue-400 hover:bg-blue-400 hover:text-white duration-300 " href="/users/sign_up">註冊</a>
                        </div>
                        {/* 登入後的會員導覽按鍵 */}
                        <div className="logging hidden mr-4">
                            <button className="bg-blue-400 text-white py-2 px-2 rounded-full"><FiUser className="text-xl"/></button>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
    </div>
    )
}

export default Header;