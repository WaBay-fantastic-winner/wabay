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
        'imgSrc': 'https://wubaywubay.herokuapp.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--5714e3ed5d71c953fd3f2048ee611b33f7e5af1a/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RkhKbGMybDZaVjkwYjE5c2FXMXBkRnNIYVFMb0Eya0M5QUU9IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--cd9853933e677761435f345d6c423d479b21856a/%E4%BA%9E%E7%B1%B32.jpg',
        'link': '/projects/1'
    },
    {
        'imgSrc': 'https://wubaywubay.herokuapp.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4f7f6a764fc96c06bb5f46fe7ebad152da9276e5/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RkhKbGMybDZaVjkwYjE5c2FXMXBkRnNIYVFMb0Eya0M5QUU9IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--cd9853933e677761435f345d6c423d479b21856a/%E4%BA%9E%E7%B1%B3.jpg',
        'link': '/projects/2'
    },
    {
        'imgSrc': 'https://wubaywubay.herokuapp.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0e90f8c34b73884b896d41d37e76621d9047be80/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lKYW5CbFp3WTZCa1ZVT2hSeVpYTnBlbVZmZEc5ZmJHbHRhWFJiQjJrQzZBTnBBdlFCIiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--5b52a697361bd75c0c9a45f6f610b91d7bc19218/%E9%BB%91%E8%B2%93.jpeg',
        'link': '/projects/3'   
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