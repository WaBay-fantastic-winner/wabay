import { Controller } from "stimulus"

export default class extends Controller {
    connect() {
      const bullets = [...document.querySelectorAll('.bullet')];
      const bar = document.querySelector('.bar')
      const barClass = {
        '企劃概念': 0,
        '樣品狀態': 33,
        '生產階段': 66,
        '產品寄送': 100
      }
      const bulletClass = {
        '企劃概念': 1,
        '樣品狀態': 2,
        '生產階段': 3,
        '產品寄送': 4
      }  
      const status = '樣品狀態'
      const completedBullets = bullets.slice(0, bulletClass[status])
      completedBullets.forEach( (ele) => { ele.classList.add('completed') })
      bar.style.width = barClass[status] + "%"
    }
}