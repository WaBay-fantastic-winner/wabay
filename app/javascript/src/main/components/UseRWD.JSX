import { useState,useEffect} from 'react';

const useRWD=()=>{
    const [mobile,setMobile]=useState("mobile");

    const handleRWD=()=>{
        if(window.innerWidth>768)
            setMobile("PC");
        else
            setMobile("mobile");
    }

    useEffect(()=>{
    
        window.addEventListener('resize',handleRWD);
        handleRWD(); 
        return(()=>{
            window.removeEventListener('resize',handleRWD);
        })
    },[]);

    return mobile;
}

export default useRWD;