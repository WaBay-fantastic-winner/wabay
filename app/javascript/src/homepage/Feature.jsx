import React from 'react'

const Feature = () => {

    const FeatureList = [
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-certificate-807b39d02f87476ad1d6aec6470cac3c.svg",
            text: '挖貝徽章認證'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-dividend-cf2eee542c41bd01e8c3ca0cb4785332.svg",
            text: '紅利成就回饋'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-funds-beddd4661fba281f57d94b1d684f1c9b.svg",
            text: '挖貝保障基金'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-search-bc74f1160e60f60b1f53c865c5d2c84f.svg",
            text: '公信力檢驗'
        },
        {
            src: "https://diat4w9qa5tx9.cloudfront.net/production-aws/packs/media/images/platform/pages/index/icon-main-time-990777e1d3a7e96521a44aa8612c06a1.svg",
            text: '專案進度標示'
        }
    ] 

    return (
        <section className='py-10'>
            <div className='max-w-6xl mx-auto'>
                <div className='mb-4'>
                    <h2 className='text-center font-semibold text-2xl my-3'>給予贊助者的信任承諾</h2>
                    <p className='text-center'>所有專案皆經由平台把關，<br/>致力給贊助會員們最安心的保障！</p>
                </div>
                <div className='my-3 md:px-10'>
                    <ul className='flex flex-wrap justify-center'>
                        {FeatureList.map(item=>(
                            <li className='w-1/3 md:w-1/5 flex  justify-center'><a href=""><img src={item.src} alt={item.text} className="mx-auto"/><h3 className='font-semibold text-xl'>{item.text}</h3></a></li>
                        ))}
                    </ul>
                </div>
            </div>
        </section>
    )
}

export default Feature