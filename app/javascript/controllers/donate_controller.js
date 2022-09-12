import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'sum', 'extraDonate' , 'amount' ]

  getSum(a = 1) {
    const sum = this.amountTarget.value * this.element.dataset.price + Number(this.extraDonateTarget.value)
    this.sumTarget.textContent = sum

    const donateItemTitle = this.element.dataset.donateItemTitle
    const projectId = this.element.dataset.projectId
    if (a !== 0){
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
        additionalSum: `${sum}`,
        });
    }
  }
  
  connect() {
    this.sumTarget.textContent = this.element.dataset.price;
    this.sum = this.element.dataset.price
  }

  subtract() {
    this.amountTarget.value <= 1 ? this.amountTarget.value = 1 : this.amountTarget.value -- ;
    this.getSum(0)
  }

  plus() {
    this.amountTarget.value ++;
    this.getSum(0)
  }

  reset() {
    this.extraDonateTarget.value = 0;
    this.getSum(0)
  }

  hundred() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 100;
    this.getSum(0)
  }
  
  thousand() {
    this.extraDonateTarget.value = Number(this.extraDonateTarget.value) + 1000;
    this.getSum(0)
  }
  
  hundredsDigit() {
    this.extraDonateTarget.value = Math.ceil(Number(this.extraDonateTarget.value)/100) * 100;
    this.getSum(0)
  }

  integer() {
    // 不是正整數或不是數字都會變空字串
    this.amountTarget.value = this.amountTarget.value.replace(/^(0+)|[^\d]+/g,'');
    this.getSum(0)
  }

  priceInteger() {
    this.extraDonateTarget.value = this.extraDonateTarget.value.replace(/^(0+)|[^\d]+/g,'');
    this.getSum(0)
  }  
}