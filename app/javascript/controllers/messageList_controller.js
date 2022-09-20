import { Controller } from 'stimulus';
import consumer from '../channels/consumer';

export default class extends Controller {
  static targets = ['input', 'message', 'bottom', 'box'];

  connect() {
    console.log('connected to the message channel')
    this.channel = consumer.subscriptions.create('MessageChannel', {
      connected: this._cableConnected.bind(this),
      disconnected: this._cableDisconnected.bind(this),
      received: this._cableReceived.bind(this),
    });
    // this.bottomTarget.scrollIntoView({
    //   block: "end",
    // });
    this.boxTarget.scrollTop = this.boxTarget.scrollHeight; // 设置聊天区域的滚动条为最新内容的位置
  }

  clearInput() {
    this.inputTarget.value = '';
  }

  _cableConnected() {
    // Called when the subscription is ready for use on the server
  }

  _cableDisconnected() {
    // Called when the subscription has been terminated by the server
  }

  _cableReceived(data) {
    // Called when there's incoming data on the websocket for this channel
    // console.log(data);
    this.messageTarget.innerHTML += data.message;
    this.inputTarget.value = '';
  }
  bottom() {
    console.log(123);
    this.boxTarget.scrollTop = this.boxTarget.scrollHeight;
  }
}