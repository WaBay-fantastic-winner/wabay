import { Controller } from "stimulus"
import * as dayjs from 'dayjs'

export default class extends Controller {
  static targets = ["leftTime"]

  connect() {
    const endTimeArr = this.element.dataset.projectTime.split(' ')
    const endTime = dayjs(endTimeArr[0], endTimeArr[1])

    function leftTimer(endTime) {
      const totalSeconds = endTime.diff(dayjs(),'seconds')
      const leftTime =  document.querySelector('#leftTime')
      if (totalSeconds <= 0) {
        leftTime.textContent = '募款已結束'
        leftTime.classList.add('text-red-500')
      } else {
        const days = parseInt(totalSeconds / 60 / 60 / 24, 10);
        const hours = parseInt(totalSeconds / 60 / 60 % 24, 10);
        const minutes = parseInt(totalSeconds / 60 % 60, 10); 
        const seconds = parseInt(totalSeconds % 60, 10); 
        leftTime.textContent = days + "天" + hours + "時" + minutes + "分" + seconds + "秒";
      }
    }
    setInterval(function(){leftTimer(endTime)}, 1000)
  }
}