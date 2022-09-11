import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'sum', 'extraDonate' , 'amount', 'formSum' ]

  getSum() {
    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value)
    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }
  
  connect() {
    this.sumTarget.textContent = this.element.dataset.price;
  }

  subtract() {
    this.amountTarget.value <= 1 ? this.amountTarget.value = 1 : this.amountTarget.value -- ;
    this.getSum()
  }

  plus() {
    this.amountTarget.value ++;
    this.getSum()
  }

  reset() {
    this.extraDonateTarget.value = 0;
    this.getSum()
  }

  hundred() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 100;
    this.getSum()
  }
  
  thousand() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 1000;
    this.getSum()
  }
  
  hundredsDigit() {
    this.extraDonateTarget.value = Math.ceil(Number(this.extraDonateTarget.value)/100) * 100;
    this.getSum()
  }

  integer() {
    // 不是正整數或不是數字都會變空字串
    this.amountTarget.value = this.amountTarget.value.replace(/^(0+)|[^\d]+/g,'');
    this.getSum()
  }

  priceInteger() {
    this.extraDonateTarget.value = this.extraDonateTarget.value.replace(/^(0+)|[^\d]+/g,'');
    this.getSum()
  }  
}