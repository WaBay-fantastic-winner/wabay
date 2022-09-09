import { Controller } from "stimulus"

let aa = () => {
  console.log(1222);
}

export default class extends Controller {
  static targets = [ 'sum', 'extraDonate' ]
  
  connect() {
    console.log(123);
  }

  subtract() {
    console.log(22);
  }

  plus() {
    console.log(33);
    aa()
  }

  reset() {
    this.extraDonateTarget.value = 0
  }

  hundred() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 100
  }
  
  thousand(){
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 1000
  }
  
  integer(){

  }
}