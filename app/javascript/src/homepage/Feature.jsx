import React from 'react'

const Feature = () => {
    const FeatureList = [
        {
            src: "./img/track.jpg",
            text: '關注追蹤'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-dividend-cf2eee542c41bd01e8c3ca0cb4785332.svg",
            text: '精準搜尋'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-funds-beddd4661fba281f57d94b1d684f1c9b.svg",
            text: '財富自由'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-search-bc74f1160e60f60b1f53c865c5d2c84f.svg",
            text: '即時通訊'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-time-990777e1d3a7e96521a44aa8612c06a1.svg",
            text: '進度標示'
        }
    ] 

    return (
        <>
            <div className='max-w-6xl mx-auto'>
                <div className='mb-4'>
                    <h2 className='text-center font-semibold text-2xl my-3'>Wubay的五大特色</h2>
                    <p className='text-center'>致力給贊助會員們最安心的保障！</p>
                </div>
                <div className='my-3 md:px-10'>
                    <ul className='flex flex-wrap justify-center'>
                        {FeatureList.map((item, index)=>(
                            <li className='w-1/3 md:w-1/5 flex  justify-center' key={index}><a href=""><img src={item.src} alt={item.text} className="mx-auto"/><h3 className='font-semibold text-xl'>{item.text}</h3></a></li>
                        ))}
                    </ul>
                </div>
            </div>
        </>
    )
}

export default Feature