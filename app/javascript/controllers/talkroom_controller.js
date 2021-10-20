import { Controller } from '@hotwired/stimulus'
import fabricjs from 'fabricjs'
import Peer from 'skyway-js'

export default class extends Controller {
  static targets = [ 'roomId' ]

  async connect() {
    let canvas = new fabric.Canvas('canvas');
    const circle = new fabric.Circle({
      left: 50,
      top: 50,
      width: 40,
      height: 40,
      radius: 40,
      fill: 'royalblue',
      hasControls: false,
      hasBorders: false
    });
    canvas.add(circle);


    this.existingCall = null;

    this.localStream = await navigator.mediaDevices.getUserMedia({
      video: false,
      audio: true,
    }).catch(console.error);

    this.peer = new Peer({
      key: xxx, // TODO: Credentialから読み込む Rails.application.credentials.skyway[:api_key]
      debug: 3
    });
    this.peer.on('open', () => {
      console.log('this.peer.id', this.peer.id)
    });
    this.peer.on('call', (call) => {
      call.answer(this.localStream); // ビデオ電話の時のみ必要かも
      this.setupCallEventHandlers(call);
    });
    this.peer.on('error', (err) => {
      alert(err.message);
    });
  }

  makeCall() {
    console.log("this.roomIdTarget.value", this.roomIdTarget.value)
    if (!this.roomIdTarget.value) {
      return;
    }
    const call = this.peer.joinRoom(this.roomIdTarget.value, { mode: 'sfu', stream: this.localStream });
    this.setupCallEventHandlers(call);
  }

  endCall() {
    this.existingCall.close();
  }

  setupCallEventHandlers(call) {
    console.log("call", call)

    if (this.existingCall) {
      this.existingCall.close();
    };

    this.existingCall = call;
    this.roomIdTarget.value = this.existingCall.name
    console.log("this.existingCall.name", this.existingCall.name)
    console.log("this.roomIdTarget.value", this.roomIdTarget.value)
  }
}
