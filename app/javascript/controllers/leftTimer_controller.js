import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    let endTime = this.element.dataset.projectTime.split(' ')
    let endYear = endTime[0].split('-')[0]
    let endMonth = endTime[0].split('-')[1]
    let endDay = endTime[0].split('-')[2]
    let endHour = endTime[1].split(':')[0]
    let endMinute = endTime[1].split(':')[1]
    let endSecond = endTime[1].split(':')[2]

    function leftTimer(year, month, day, hour, minute, second) {
      const leftTime = (new Date(year, month - 1, day, hour, minute, second)) - (new Date());
      const days = parseInt(leftTime / 1000 / 60 / 60 / 24, 10);
      const hours = parseInt(leftTime / 1000 / 60 / 60 % 24, 10);
      const minutes = parseInt(leftTime / 1000 / 60 % 60, 10); 
      const seconds = parseInt(leftTime / 1000 % 60, 10); 
      document.getElementById("left-time").innerHTML = days + "天" + hours + "時" + minutes + "分" + seconds + "秒";
    }
    setInterval(() => {leftTimer(endYear,endMonth,endDay,endHour,endMinute,endSecond)}, 1000);
  }
}