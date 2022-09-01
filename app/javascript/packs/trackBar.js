const  bullets  =  [...document.querySelectorAll('.bullet')];
const  bar = document.querySelector('.bar')
const barClass = {
  '企劃目的': 0,
  '款項設定': 33,
  '回饋品寄送': 66,
  '實際執行': 100
}
const bulletClass = {
  '企劃目的': 1,
  '款項設定': 2,
  '回饋品寄送': 3,
  '實際執行': 4

}
document.addEventListener('DOMContentLoaded', () => {
  bar.style.width = barClass['款項設定'] + "%"
  bullets.splice(`${bulletClass['款項設定']}`)
  bullets.forEach( (ele) => { 
    ele.classList.add('completed')
  })

})
