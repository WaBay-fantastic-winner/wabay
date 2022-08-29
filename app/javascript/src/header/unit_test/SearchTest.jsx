import React from 'react'
import axios from 'axios'

const SearchTest = async () => {
  const res = await (
        axios.get(`/projects/search`)
    )
    console.log(res)
}

export default SearchTest