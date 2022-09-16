import React from 'react'
import track from '../assets/img/track.png'
import communication from '../assets/img/communication.png'
import pay from '../assets/img/pay.png';
import progress from '../assets/img/progress.png'
import search from '../assets/img/search.png'

const Feature = () => {
    const FeatureList = [
        {
            src: communication,
            text: '即時通訊'
        },
        {
            src: search,
            text: '精準搜尋'
        },
        {
            src: pay,
            text: '安全交易'
        },
        {
            src: track,
            text: '關注追蹤'
        },
        {
            src: progress,
            text: '進度標示'
        }
    ] 

    return (
        <div className='max-w-6xl mx-auto'>
            <div className='mb-4'>
                <h2 className='my-3 text-2xl font-semibold text-center'>Wubay的五大特色</h2>
                <p className='mb-8 text-center'>致力給贊助會員們最安心的保障！</p>
            </div>
            <div className='my-3 md:px-10'>
                <ul className='flex flex-wrap justify-center'>
                    {FeatureList.map((item, index)=>(
                        <li className='w-1/3 md:w-1/5' key={index}><img src={item.src} alt={item.text} className="w-20 mx-auto mb-3"/><h3 className='text-xl font-semibold text-center'>{item.text}</h3></li>
                    ))}
                </ul>
            </div>
        </div>
    )
}

export default Feature