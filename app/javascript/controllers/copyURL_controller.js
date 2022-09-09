import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    const href = location.href
    document.getElementById('URL').value = href
  }

  copy(){
    const URL = document.getElementById('URL')
    URL.select();
    document.execCommand('copy');
    URL.value = '✿✿✿ 複製成功囉 ✿✿✿'
    URL.classList.add('text-red-400')
    setTimeout(() => {
      const href = location.href
      URL.classList.remove('text-red-400')
      document.getElementById('URL').value = href
    },1000)

  }
}