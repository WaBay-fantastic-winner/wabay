import { Controller } from 'stimulus';
import consumer from '../channels/consumer';

export default class extends Controller {
  static targets = ['input', 'message', 'bottom', 'box'];

  connect() {
    const projectId = this.element.dataset.projectId
    this.channel = consumer.subscriptions.create(
      { channel: 'MessageChannel', project_id: projectId }, 
      // 'MessageChannel',  
      {
      connected: this._cableConnected.bind(this),
      disconnected: this._cableDisconnected.bind(this),
      received: this._cableReceived.bind(this),
    });
    this.boxTarget.scrollTop = this.boxTarget.scrollHeight;
  }

  clearInput() {
    this.inputTarget.value = '';
  }

  _cableConnected() {
    // Called when the subscription is ready for use on the server
    console.log('connected');
  }

  _cableDisconnected() {
    // Called when the subscription has been terminated by the server
  }

  _cableReceived(data) {
    // Called when there's incoming data on the websocket for this channel

    this.messageTarget.innerHTML += data;
    this.inputTarget.value = '';
  }
  bottom() {
    setTimeout(()=>{
      this.boxTarget.scrollTop = this.boxTarget.scrollHeight;
    },150)

  }
}