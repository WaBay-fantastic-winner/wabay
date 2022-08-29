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
import './banner.css';


const Rand = (min, max) => {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

const ImgUrl = () => {
    const id = Rand(1, 200);
    return `https://picsum.photos/id/${id}/1000/550`;
}

const CreateSlide = () => {
    return (
        <SwiperSlide className='flex justify-center rounded-3xl items-center'>
            <a href=""><img className="img  rounded-3xl" src={ImgUrl()} alt="" /></a>
        </SwiperSlide>
    );
}

const BannerList = (props) => {
    return (<li className='mx-3 md:mx-6'>{props.text}</li>)
}

const Banner = () => {

    const device = UseRWD();

    return (
        <section className='banner'>
            <div className='banner-list'>
                <ul className='flex justify-center items-center h-16 md:text-xl text-slate-500'>
                    <BannerList text="原創設計"/>
                    <BannerList text="社會公益"/>
                    <BannerList text="預購商品"/>
                    <BannerList text="挖貝選物"/>
                </ul>
            </div>
            <Swiper
                modules={[Navigation, Pagination, Autoplay]}
                // {device === "PC" ? slidesPerView={1.5} : slidesPerView={"auto"}}

                slidesPerView={device === "PC" ? 1.5 : "auto"}
                navigation
                loop={true}
                spaceBetween={30}
                centeredSlides={true}
                autoplay={{ delay: 1000 }}
                pagination={{ clickable: true }}  
            >
                {CreateSlide()}
                {CreateSlide()}
                {CreateSlide()}
                {CreateSlide()}
            </Swiper>
        </section>
    );
};

export default Banner;