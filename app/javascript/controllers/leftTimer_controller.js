import { Controller } from "stimulus"
import * as dayjs from 'dayjs'

export default class extends Controller {
  static targets = ["leftTime"]

  connect() {
    const endTimeArr = this.element.dataset.projectTime.split(' ')
    const endTime = dayjs(endTimeArr[0], endTimeArr[1])
    const leftTime =  document.querySelector('#leftTime')

    let leftTimeID = setInterval(function(){leftTimer(endTime)}, 1000)
    function leftTimer(endTime) {
      const totalSeconds = endTime.diff(dayjs(),'seconds')

      if (totalSeconds <= 0) {
        leftTime.textContent = '募款已結束'
        leftTime.classList.add('text-red-500')
        clearInterval(leftTimeID)
        document.querySelector('.donate-link').remove()
        let closeDonate = document.createElement('p')
        closeDonate.setAttribute('class','py-2 text-center text-gray-500 bg-gray-300 rounded-lg')
        closeDonate.textContent = '募資已結束'
        document.querySelector('.donate-box').appendChild(closeDonate)
        document.querySelector('.donate-items')?.remove()
      } else {
        const days = parseInt(totalSeconds / 60 / 60 / 24, 10);
        const hours = parseInt(totalSeconds / 60 / 60 % 24, 10);
        const minutes = parseInt(totalSeconds / 60 % 60, 10); 
        const seconds = parseInt(totalSeconds % 60, 10); 
        leftTime.textContent = days + "天" + hours + "時" + minutes + "分" + seconds + "秒";
      }
    }
  }
}