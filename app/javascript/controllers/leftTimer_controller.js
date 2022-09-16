import { Controller } from "stimulus"
import * as dayjs from 'dayjs'

export default class extends Controller {
  static targets = ["leftTime"]

  connect() {
    const endTimeArr = this.element.dataset.projectTime.split(' ')
    const endTime = dayjs(endTimeArr[0], endTimeArr[1])
    const endYear = endTime.$y
    const endMonth = endTime.$M + 1
    const endDay = endTime.$D
    const endHour = endTime.$H
    const endMinute = endTime.$m
    const endSecond = endTime.$s

    function leftTimer(year, month, day, hour, minute, second) {
      const leftTime = (new Date(year, month - 1, day, hour, minute, second)) - (new Date());
      const days = parseInt(leftTime / 1000 / 60 / 60 / 24, 10);
      const hours = parseInt(leftTime / 1000 / 60 / 60 % 24, 10);
      const minutes = parseInt(leftTime / 1000 / 60 % 60, 10); 
      const seconds = parseInt(leftTime / 1000 % 60, 10); 
      // this.leftTimeTarget.textContent = days + "天" + hours + "時" + minutes + "分" + seconds + "秒";
      document.querySelector('#leftTime').textContent = days + "天" + hours + "時" + minutes + "分" + seconds + "秒";
    }
    setInterval(function(){leftTimer(endYear,endMonth,endDay,endHour,endMinute,endSecond)}, 1000)
  }
}