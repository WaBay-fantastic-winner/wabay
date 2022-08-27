import { FaAngleLeft } from 'react-icons/fa';
import { FiMenu } from 'react-icons/fi';
import React from 'react';

const MobileNav = () => {

    const merchandiseArray = [
        "原創設計",
        "社會公益",
        "設計商品"
    ]

    return (
        <>
            <input id="mobile-nav-switch" type="checkbox" className="hidden" />
            <label htmlFor="mobile-nav-switch" className="lg:hidden ml-8 text-2xl">
                <span className="inline-block"><FiMenu/></span>
                <span className="hidden"><FaAngleLeft/></span>
            </label>
            <div className="mobile-nav w-full absolute px-20 py-7 text-gray-500 lg:hidden z-50 bg-white">
                <div className="mb-3">
                    <a className="px-4 text-2xl" href="">探索</a>
                </div>
                <div className="mb-3">
                    <h2 className="font-bold text-blue-400">Themes</h2>
                    <ul className="px-4 text-2xl">
                        {merchandiseArray.map(text=>(
                            <li key={text}><a className="block py-2" href="">{text}</a></li>
                        ))}
                    </ul>
                </div>
                <div className="mb-3">
                    <h2 className="font-bold text-blue-400">Member</h2>
                    <ul className="px-4 text-2xl">
                        <li><a className="block py-2" href="/users/sign_in">登入</a></li>
                        <li><a className="block py-2" href="/users/sign_up">註冊</a></li>
                        <li><a className="block py-2" href="">未定</a></li>
                    </ul>
                </div>
                <div className="mb-3">
                    <h2 className="font-bold text-blue-400">Proposal</h2>
                    <a className="px-4 block py-4 text-2xl" href="">提案</a>
                </div>
                <div className="flex justify-center">
                    <div className="mr-3">
                        <p className='text-7xl'>𓃰</p>
                    </div>
                    <div>
                        <p>Copyright ©2022 Backer-Founder <br/>
                        All rights reserved</p>
                    </div>
                </div>
            </div>
        </>    
    )
}

export default MobileNav