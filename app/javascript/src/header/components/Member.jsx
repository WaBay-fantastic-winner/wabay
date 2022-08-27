import React from 'react'

const Member = () => {
  return (
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
  )
}

export default Member