import React from 'react'

const Footer = () => {

  const AboutUs = [
      '關於',
      '關於我們',
      '挖貝徽章認證',
      '贊助保障規範',
      '會員紅利介紹',
      '提案服務說明'
  ]

  const Assistance = [
    '支援',
    '常見問題',
    '使用條款',
    '隱私權政策',
    '免責聲明'
  ]

  const Contact = [
    '聯繫',
    '聯繫我們',
    '提案諮詢',
    '品牌資源'
  ]

  const More = [
    '更多內容',
    '貝殼集器',
    '貝殼放大',
    '群眾觀點'
  ]

  return (
    <section className="">
      <div className='max-w-6xl flex flex-wrap justify-between mx-auto px-10'>
        <div>
          {AboutUs.map((item, index) => index === 0 && <h2 id={index}>{item}</h2>)}
          <ul>
            {AboutUs.map((item, index) => index != 0 && <li id={index}>{item}</li>)}
          </ul>
        </div>
        <div>
            {Assistance.map((item, index) => index === 0 && <h2 id={index}>{item}</h2>)}
            <ul>
              {Assistance.map((item, index) => index != 0 && <li id={index}>{item}</li>)}
            </ul>
        </div>
        <div>
            {Contact.map((item, index) => index === 0 && <h2 id={index}>{item}</h2>)}
            <ul>
                {Contact.map((item, index) => index != 0 && <li id={index}>{item}</li>)}
            </ul>
        </div>
        <div>
            {More.map((item, index) => index === 0 && <h2 id={index}>{item}</h2>)}
            <ul>
                {More.map((item, index) => index != 0 && <li id={index}>{item}</li>)}
            </ul>
        </div>
      </div>
    </section>
  )
}

export default Footer