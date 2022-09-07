import React ,{ useState, useEffect, useRef } from 'react';
import ProgressBar from './ProgressBar';
import axios from '../../../lib/http/client'

const FundraisingItem = () => {
    let [projectItems, setProjectItems] = useState('')

    // 向後端取資料
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

    useEffect(() => {
        fetchProject()
    },[])

    projectItems && console.log(projectItems)

    // 抓取網址上的關鍵字


    // 網路做法
    // const effectRan = useRef(false)
    // useEffect( () => {
    //     if (effectRan.current === false){
    //         let fetchProject = () => {
    //             axios.get('/projects.json')
    //         .then(resp => console.log(resp.data))
    //         .catch( err => console.log(err))
    //         }
    //         fetchProject()
    //     }
    //     return () => {
    //         effectRan.current = true
    //     }
    // },[])


    return (
        <> 
            {projectItems && projectItems.map((i)=>{
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
            })}
        </>
    )
}
export default FundraisingItem