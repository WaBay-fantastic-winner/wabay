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
  
  let status = '樣品狀態'
  bullets.splice(bulletClass[status])
  bullets.forEach( (ele) => { ele.classList.add('completed') })
  bar.style.width = barClass[status] + "%"
})

