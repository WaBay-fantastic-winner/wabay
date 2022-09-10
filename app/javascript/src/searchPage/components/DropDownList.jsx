import React , { useRef , useState} from 'react'

const DropDownList = () => {
  const selectForm = useRef()
  const handleSubmit = () => {selectForm.current.submit()}
  const AllOption = [
    {
      "type": "全部主題", 
      "value": "all"
    },
    {
      "type": "提案時間從新到舊", 
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
  const [option,setOption] = useState(AllOption)
  let querystring = (new URL(document.location)).searchParams;
  let selectedOption = querystring.get('type')
  
  return (
    <div>
      <form action="/projects" method="get" ref={selectForm} onChange={handleSubmit} >
        <select name="type" id="type" defaultValue={selectedOption} className='p-2 pr-5 rounded-md border border-purple-400 border-solid focus:outline-none focus:ring focus:border-purple-300'>
          {option.map(ele=>(
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
