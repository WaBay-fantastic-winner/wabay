// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'tw-elements';
import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../stylesheets/index"
import "../../assets/stylesheets/actiontext.scss"

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
// --------comment accordion
  const contentBtn = document.getElementsByClassName('contentBox')

  for (let i = 0; i < contentBtn.length; i++) {
    contentBtn[i].addEventListener('click', function () {
      this.classList.toggle('active')
    })
  }
})

