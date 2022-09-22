/* eslint-disable import/no-anonymous-default-export */
import React from 'react'
import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation, Pagination, Autoplay } from 'swiper';
import  UseRWD from './components/UseRWD.JSX';
import 'swiper/swiper.scss';
import 'swiper/modules/navigation/navigation.scss';
import 'swiper/modules/pagination/pagination.scss';
import 'swiper/modules/scrollbar/scrollbar.scss';
import 'swiper/modules/autoplay/autoplay.scss';
import '../../stylesheets/banner.css';

const imgUrl = [
    {
        'imgSrc': 'https://wubaywubay.herokuapp.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBZdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2410270d604b6a2badd2ed64cc278f72efe95467/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hSeVpYTnBlbVZmZEc5ZmJHbHRhWFJiQjJrQzZBTnBBdlFCIiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--5b52a697361bd75c0c9a45f6f610b91d7bc19218/%E5%AC%B0%E5%85%92%E6%BB%91%E6%9D%BF%E8%BB%8A.jpeg',
        'link': '/projects/10'
    },
    {
        'imgSrc': 'https://wubaywubay.herokuapp.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYm89IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c3f67c1e404f8d067a6e4b57f851b405d829700a/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hSeVpYTnBlbVZmZEc5ZmJHbHRhWFJiQjJrQzZBTnBBdlFCIiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--5b52a697361bd75c0c9a45f6f610b91d7bc19218/1616040333-2080244173-g_n.jpeg',
        'link': '/projects/31'
    },
    {
        'imgSrc': 'https://wubaywubay.herokuapp.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYzA9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2a1f578a90f4b434cc6cd30c2f1000df7f430413/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RkhKbGMybDZaVjkwYjE5c2FXMXBkRnNIYVFMb0Eya0M5QUU9IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--67314b8f0ba5f658a2b45d430c252feb57d7ef31/%E9%98%B2%E7%9B%9C%E5%8D%88%E9%A4%90%E8%A2%8B1.png',
        'link': '/project/33'   
    },
    {
        'imgSrc': 'https://wubaywubay.herokuapp.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZE09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--ced141c4635600e08850c435e8301d4eda1d590c/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hSeVpYTnBlbVZmZEc5ZmJHbHRhWFJiQjJrQzZBTnBBdlFCIiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--5b52a697361bd75c0c9a45f6f610b91d7bc19218/%E9%A0%98%E5%B8%B6%E6%B0%B4%E7%93%B61.jpeg',  
        'link': '/project/34'
    }
]    

const BannerList = (props) => {
    return (<li className='mx-2 md:mx-6'>{props.text}</li>)
}

const Banner = () => {
    const device = UseRWD();

    return (
        <>
            <div className='banner-list'>
                <ul className='flex items-center justify-center h-16 md:text-xl text-slate-500'>
                    <BannerList text="原創設計"/>
                    <BannerList text="社會公益"/>
                    <BannerList text="預購商品"/>
                    <BannerList text="Wubay選物"/>
                </ul>
            </div>
            <Swiper
                modules={[Navigation, Pagination, Autoplay]}
                slidesPerView={device === "PC" ? 1.75 : 1 }
                navigation
                loop={true}
                spaceBetween={30}
                centeredSlides={true}
                autoplay={{ delay: 3500 }}
                pagination={{ clickable: true }}  
            >
                {imgUrl.map((img, index) =>( 
                    <SwiperSlide className='flex items-center justify-center' key={index} >
                        <div className='img'>
                            <a href={img.link} ><img className={`${ device === "PC" && 'rounded-3xl' } w-full h-full object-cover`} src={img.imgSrc} alt="專案照片" /></a>
                        </div>
                    </SwiperSlide>
                    ))}
            </Swiper>
        </>
    );
};

export default Banner;