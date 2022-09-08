import React ,{ useState, useEffect, useRef } from 'react';
import ProgressBar from './ProgressBar';
import DaysLeft from './DaysLeft';
import axios from '../../../lib/http/client'

const FundraisingItem = () => {
    let [projectItems, setProjectItems] = useState([])

    useEffect(() => {
        let fetchProject = () => {
            axios.get('/projects.json')
                .then(resp => {
                    let querystring = (new URL(document.location)).searchParams;
                    let params = querystring.get('keyword') || querystring.get('type')
                    if (params){
                        let filterResult = resp.data.filter((item) => item.project_title.indexOf(params) != -1 )
                        setProjectItems(filterResult)
                    }else{
                        setProjectItems(resp.data)
                    }
                })
                .catch( err => console.log(err))
                }
        fetchProject()
    },[])

    console.log(projectItems);
    console.log(new Date()); 

    return (
        <> 
            {projectItems.length > 0 ? projectItems.map((item , index)=> (
                <div className="FundraisingItem col-span-3 pb-6" id={index}>
                {/* <img class="w-full" src={props.src} alt="{props.alt}"/> */}
                    <a className='' href={`/projects/${item.id}`}>
                        <img className="w-full rounded-3xl" src="https://fakeimg.pl/300x200/200" alt="ss"/>
                    </a>
                    <div className='mb-7'>
                        <p className='hover:text-gray-500 my-1'>props.class</p>
                        <h3 className='hover:text-blue-400 my-1 font-semibold text-xl'><a className='text-blue-400 hover:text-blue-300' href={`/projects/${item.id}`} >{item.project_title}</a></h3>
                        <p className='my-1'>提案者 {item.organizer}</p>
                    </div>
                    <div>
                        <span className='my-1'>NT $ 10000</span>
                    </div>
                    <ProgressBar done="80"/>
                    <div>
                        <DaysLeft endTime={item.project_end_time} />
                    </div>
                </div>
            )) :
            <div class="col-span-9">
                <p class="text-center">目前沒有專案，試試看重新探索吧！</p>
            </div>}
        </>
    )
}
export default FundraisingItem