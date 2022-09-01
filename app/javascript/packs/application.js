// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../application.css"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
import "controllers"


document.addEventListener('DOMContentLoaded', () => {
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
  
  bullets.splice(`${bulletClass['款項設定']}`)
  bullets.forEach( (ele) => { ele.classList.add('completed') })
  bar.style.width = barClass['款項設定'] + "%"
})

