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
      "type": "原創設計", 
      "value": "origin"
    },
    {
      "type": "社會公益", 
      "value": "society"
    },
    {
      "type": "獨立集資", 
      "value": "independence"
    },
  ]
  const [option,setOption] = useState(AllOption)
  let querystring = (new URL(document.location)).searchParams;
  let params = querystring.get('type')
  console.log(params);
  return (
    <div>
      <form action="/projects" method="get" ref={selectForm} onChange={handleSubmit} >
        <select name="type" id="type" className='p-2 pr-5 rounded-md border border-purple-400 border-solid focus:outline-none focus:ring focus:border-purple-300'>
          {/* <option>全部主題</option>
          <option value="origin" selected={true}>原創設計</option>
          <option value="society" >社會公益</option>
          <option value="independence">獨立集資</option> */}
          {option.map(ele=>(
            <option key={ele.value} value={ele.value} selected={ele.value === params}>
              {ele.type}
            </option>
          ))}
        </select>
      </form>
    </div>
  )
}

export default DropDownList
