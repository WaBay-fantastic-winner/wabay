import React from 'react';
import ProgressBar from './ProgressBar';

const FundraisingItem = (props) => {
    return (
        <div className="FundraisingItem col-span-3 pb-6">
            {/* <img class="w-full" src={props.src} alt="{props.alt}"/> */}
            <img className="w-full rounded-3xl" src="https://fakeimg.pl/300x200/200" alt="ss"/>
            <div className='mb-7'>
                <p className='hover:text-gray-500 my-1'>props.class</p>
                <h3 className='hover:text-blue-400 my-1 font-semibold text-xl'>props.title</h3>
                <p  className='my-1'>提案者 <a className='text-blue-400 hover:text-blue-300'  href="">五貝貝</a></p>
            </div>
            <div>
                <span className='my-1'>NT $ 10000</span>
            </div>
            <ProgressBar/>
            <div className=''>
                <span>倒數??天</span>
            </div>
        </div>
    )
}

export default FundraisingItem