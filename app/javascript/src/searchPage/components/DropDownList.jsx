import React , { useRef } from 'react'

const DropDownList = () => {
  const selectForm = useRef()
  const handleSubmit = () => {selectForm.current.submit()}
  const AllOption = [
    {
      "type": "全部主題", 
      "value": "all"
    },
    {
      "type": "最新提案", 
      "value": "desc"
    },
    {
      "type": "提案時間從舊到新", 
      "value": "asc"
    },
    {
      "type": "熱門提案", 
      "value": "popular"
    },
  ]
  let querystring = (new URL(document.location)).searchParams;
  let selectedOption = querystring.get('type')
  
  return (
    <div>
      <form action="/projects" method="get" ref={selectForm} onChange={handleSubmit} >
        <select name="type" id="type" defaultValue={selectedOption} className='p-2 pr-5 border border-purple-400 border-solid rounded-md input-focus'>
          {AllOption.map(ele=>(
            <option key={ele.value} value={ele.value}>
              {ele.type}
            </option>
          ))}
        </select>
      </form>
    </div>
  )
}

export default DropDownList