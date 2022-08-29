import axios from 'axios'

const searchAPI = () => {
    axios.get(`http://127.0.0.1:3000/projects/search`)
        .then(res =>{console.log(res);})
}

export {searchAPI}