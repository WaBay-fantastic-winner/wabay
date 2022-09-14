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
    return `https://picsum.photos/id/${id}/1000/500`;
}

const CreateSlide = () => {
    const device = UseRWD();
    return (
        <SwiperSlide className='flex items-center justify-center'>
            <a href=""><img className={`${ device === "PC" && 'rounded-3xl'}`} src={ImgUrl()} alt="" /></a>
        </SwiperSlide>
    );
}

const imgUrl = [
    {
        'src': 'https://image-cdn-flare.qdm.cloud/q62d43d7008f8e/image/data/markus-winkler-1lmpfq7zxem-unsplash_1.jpg'
    },
    {
        'src': 'https://cdn.quickper.com/media/oldlondon/article/706d3d17-35de-4371-b45b-617aafb99345/origin.jpeg'
    },
    {
        'src': 'https://cdn02.pinkoi.com/product/hDrkPCqW/0/8/640x530.jpg'   
    },
    {
        'src': 'https://www.foodnext.net/dispPageBox/getFile/GetImg.aspx?FileLocation=%2FPJ-FOODNEXT%2FFiles%2F&FileName=photo-08348-i.jpg'  
    }
]    

const BannerList = (props) => {
    return (<li className='mx-2 md:mx-6 hover:text-purple-400 '><a href=''>{props.text}</a></li>)
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
                    <BannerList text="挖貝選物"/>
                </ul>
            </div>
            <Swiper
                modules={[Navigation, Pagination, Autoplay]}
                slidesPerView={device === "PC" ? 1.5 : 1 }
                navigation
                loop={true}
                spaceBetween={30}
                centeredSlides={true}
                autoplay={{ delay: 4000 }}
                pagination={{ clickable: true }}  
            >
                {imgUrl.map((img, index) =>( 
                    <SwiperSlide className='flex items-center justify-center' key={index} >
                        <div className='img'>
                            <img className={`${ device === "PC" && 'rounded-3xl' } w-full h-full object-cover`} src={img.src} alt="" />
                        </div>
                    </SwiperSlide>
                    ))}
            </Swiper>
        </>
    );
};

export default Banner;