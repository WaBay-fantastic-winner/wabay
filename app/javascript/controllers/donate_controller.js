import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'sum', 'extraDonate' , 'amount' ]

  getSum() {
    return this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value)
  }

  displayAmount(amount = this.getSum()) {
    this.sumTarget.textContent = amount
  }

  formPost(amount) {
    const donateItemTitle = this.element.dataset.donateItemTitle
    const projectId = this.element.dataset.projectId

    function sendData(path, parameters, method='post') {

      const form = document.createElement('form');
      form.method = method;
      form.action = path;
      document.body.appendChild(form);
    
      for (const key in parameters) {
          const formField = document.createElement('input');
          formField.type = 'hidden';
          formField.name = key;
          formField.value = parameters[key];
          form.appendChild(formField);
      }
      form.submit();
    }
    
    sendData('/transactions', {
      donateItemTitle: `${donateItemTitle}`,
      projectId: `${projectId}`,
      additionalSum: amount,
      });
  }

  sendToEcpay() {
    this.formPost(this.getSum())
  }
  
  connect() {
    this.sumTarget.textContent = this.element.dataset.price;
    this.sum = this.element.dataset.price
  }

  subtract() {
    this.amountTarget.value <= 1 ? this.amountTarget.value = 1 : this.amountTarget.value -- ;
    this.getSum()
    this.displayAmount()
  }

  plus() {
    this.amountTarget.value ++;
    this.getSum()
    this.displayAmount()
  }

  reset() {
    this.extraDonateTarget.value = 0;
    this.getSum()
    this.displayAmount()
  }

  hundred() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 100;
    this.getSum()
    this.displayAmount()
  }
  
  thousand() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 1000;
    this.getSum()
    this.displayAmount()
  }
  
  hundredsDigit() {
    this.extraDonateTarget.value = Math.ceil(Number(this.extraDonateTarget.value)/100) * 100;
    this.getSum()
    this.displayAmount()
  }

  integer() {
    // 不是正整數或不是數字都會變空字串
    this.amountTarget.value = this.amountTarget.value.replace(/^(0+)|[^\d]+/g,'');
    this.getSum()
    this.displayAmount()
  }

  priceInteger() {
    this.extraDonateTarget.value = this.extraDonateTarget.value.replace(/^(0+)|[^\d]+/g,'');
    this.getSum()
    this.displayAmount()
  }  
}