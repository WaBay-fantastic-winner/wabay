// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'tw-elements';
import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../application.css"

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
// ---------trackerBar
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
  const status = '產品寄送'
  const completedBullets = bullets.slice(0, bulletClass[status])
  completedBullets.forEach( (ele) => { ele.classList.add('completed') })
  bar.style.width = barClass[status] + "%"

// --------comment accordion
  const contentBtn = document.getElementsByClassName('contentBox')

  for (let i = 0; i < contentBtn.length; i++) {
    contentBtn[i].addEventListener('click', function () {
      this.classList.toggle('active')
    })
  }

  // -------------left-timer
  function leftTimer(year, month, day, hour, minute, second) {
    var leftTime = (new Date(year, month - 1, day, hour, minute, second)) - (new Date());
    var days = parseInt(leftTime / 1000 / 60 / 60 / 24, 10); 
    var hours = parseInt(leftTime / 1000 / 60 / 60 % 24, 10); 
    var minutes = parseInt(leftTime / 1000 / 60 % 60, 10); 
    var seconds = parseInt(leftTime / 1000 % 60, 10); 
    document.getElementById("left-time").innerHTML = days + "天" + hours + "時" + minutes + "分" + seconds + "秒";
  }
  let timer = setInterval(() => {leftTimer(2022,10,30,10,10,10)}, 1000);
  console.log(timer);
})

