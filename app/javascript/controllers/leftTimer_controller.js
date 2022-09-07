import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    function leftTimer(year, month, day, hour, minute, second) {
      var leftTime = (new Date(year, month - 1, day, hour, minute, second)) - (new Date());
      var days = parseInt(leftTime / 1000 / 60 / 60 / 24, 10);
      var hours = parseInt(leftTime / 1000 / 60 / 60 % 24, 10);
      var minutes = parseInt(leftTime / 1000 / 60 % 60, 10); 
      var seconds = parseInt(leftTime / 1000 % 60, 10); 
      document.getElementById("left-time").innerHTML = days + "天" + hours + "時" + minutes + "分" + seconds + "秒";
    }
    setInterval(() => {leftTimer(2022,10,30,10,10,10)}, 1000);
  }
}