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
                .catch( err => console.log(err))
                };
        fetchProject();
    },[])

    return (
        <> 
            {projectItems.length > 0 ? projectItems.map((item , index)=> (
                <div className='col-span-3 pb-6 FundraisingItem' key={index}>
                    <a className='' href={`/projects/${item.id}`}>
                        <img className='w-full rounded-3xl' src='https://fakeimg.pl/300x200/200' alt='ss'/>
                    </a>
                    <div className='mb-7'>
                        <h3 className='my-1 text-xl font-semibold hover:text-purple-400'><a className='text-purple-400 hover:text-purple-300' href={`/projects/${item.id}`} >{item.title}</a></h3>
                        <p className='my-1'>提案者 {item.organizer}</p>
                    </div>
                    <div>
                        <span className='my-1'>NT $ 10000</span>
                    </div>
                    <ProgressBar done='80'/>
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