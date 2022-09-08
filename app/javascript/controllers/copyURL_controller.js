import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'URL' ]

  connect() {
    const href = location.href
    this.URLTarget.value = href
  }

  copy(){
    this.URLTarget.select();
    document.execCommand('copy');
    this.URLTarget.value = '✿✿✿ 複製成功囉 ✿✿✿'
    this.URLTarget.classList.add('text-red-400')
    setTimeout(() => {
      const href = location.href
      this.URLTarget.classList.remove('text-red-400')
      this.URLTarget.value = href
    },1000)

  }
}