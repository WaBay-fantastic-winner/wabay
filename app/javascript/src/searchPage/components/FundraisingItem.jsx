import React ,{ useState, useEffect } from 'react';
import ProgressBar from './ProgressBar';
import DaysLeft from './DaysLeft';
import axios from '../../../lib/http/client'

const FundraisingItem = () => {
    let [projectItems, setProjectItems] = useState([])

    useEffect(() => {
        let fetchProject = () => {
            let querystring = (new URL(document.location)).searchParams;
            let keyword = querystring.get('keyword') 
            let type = querystring.get('type')
            axios.get('/api/search/projects', {
                    params: {
                        keyword: keyword,
                        type : type
                    }
                })
                .then(resp => {
                    setProjectItems(resp.data)
                })
                .catch( err => alert(err))
                };
        fetchProject();
    },[])

    return (
        <> 
            {projectItems.length > 0 ? projectItems.map((item , index)=> (
                <div className='col-span-3 mb-8 FundraisingItem ' key={index}>
                    <div className='projects-img-box'>
                        <a className='projects-link' href={`/projects/${item.id}`}>
                            <img className='object-cover w-full h-full rounded-3xl' src={item.img} alt='專案照片'/>
                        </a>
                    </div>
                    <div className='mb-4'>
                        <h3 className='my-1 text-xl font-semibold'><a className='primary-text-color hover:text-purple-300' href={`/projects/${item.id}`} >{item.title}</a></h3>
                        <p className='my-1'>提案者 {item.organizer}</p>
                    </div>
                    <div>
                        <span className='my-1'>NT $ {item.current_total}</span>
                    </div>
                    <ProgressBar percent={Math.round(item.current_total/item.amount_target*100)}/>
                    <div>
                        <DaysLeft endTime={item.end_time} />
                    </div>
                </div>
            )) :
            <div className='col-span-9'>
                <p className='text-center'>目前沒有專案，試試看重新探索吧！</p>
            </div>}
        </>
    )
}

export default FundraisingItem