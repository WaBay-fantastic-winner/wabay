import { Controller } from "stimulus"

function sum() {
      this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value)
}
export default class extends Controller {
  static targets = [ 'sum', 'extraDonate' , 'amount', 'formSum' ]
  
  connect() {
    this.sumTarget.textContent = this.element.dataset.price;
  }

  subtract() {
    this.amountTarget.value <= 1 ? this.amountTarget.value = 1 : this.amountTarget.value -- ;

    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
    
    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }

  plus() {
    this.amountTarget.value ++;

    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);

    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }

  reset() {
    this.extraDonateTarget.value = 0;

    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);

    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }

  hundred() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 100;

    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);

    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }
  
  thousand() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 1000;

    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);

    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }
  
  hundredsDigit() {
    this.extraDonateTarget.value = Math.ceil(Number(this.extraDonateTarget.value)/100) * 100;

    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);

    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }

  integer() {
    // 不是正整數或不是數字都會變空字串
    this.amountTarget.value = this.amountTarget.value.replace(/^(0+)|[^\d]+/g,'');

    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);

    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }

  priceInteger() {
    this.extraDonateTarget.value = this.extraDonateTarget.value.replace(/^(0+)|[^\d]+/g,'');
    
    this.sumTarget.textContent = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);

    this.formSumTarget.value = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value);
  }
}