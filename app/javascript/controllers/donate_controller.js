import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [  ]

  connect() {
    console.log(123);
  }

  subtract() {
    console.log(22);
  }

  plus() {
    console.log(33);
  }

  zero() {
    
  }

  hundred() {

  }
  
  thousand(){

  }
  
  integer(){

  }
}