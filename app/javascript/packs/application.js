// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'tw-elements';
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../stylesheets/index"
import "../../assets/stylesheets/actiontext.scss"
import "../../assets/stylesheets/application.css"
Rails.start()
ActiveStorage.start()
require("trix")
require("@rails/actiontext")
import "controllers"
// import Turbolinks from "turbolinks"
// Turbolinks.start() 

document.addEventListener('DOMContentLoaded', () => {

  document.querySelector('#mobile-nav-btn').addEventListener('click', () => {
    document.querySelector('main').classList.toggle('hidden')
    document.querySelector('footer').classList.toggle('hidden')
  })
})



