import { Controller } from '@hotwired/stimulus'
import fabricjs from 'fabricjs'
import Peer from 'skyway-js'

export default class extends Controller {
  static targets = [ 'peerId' ]

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
    });

    this.peer = new Peer({
      key: xxx, // TODO: Credentialから読み込む Rails.application.credentials.skyway[:api_key]
      debug: 3
    });
    this.peer.on('open', () => {
      console.log('this.peer.id', this.peer.id)
    });
    this.peer.on('call', (call) => {
      call.answer(this.localStream);
      this.setupCallEventHandlers(call);
    });
    this.peer.on('error', (err) => {
      alert(err.message);
    });
  }

  makeCall() {
    console.log("this.peerIdTarget", this.peerIdTarget)
    console.log("this.peerIdTarget.value", this.peerIdTarget.value)
    const call = this.peer.call(this.peerIdTarget.value, this.localStream);
    this.setupCallEventHandlers(call);
  }

  endCall() {
    console.log("endCall this.existingCall", this.existingCall)
    this.existingCall.close();
  }

  setupCallEventHandlers(call) {
    console.log("this.existingCall", this.existingCall)
    if (this.existingCall) {
      this.existingCall.close();
    };

    this.existingCall = call;

    call.on('stream', (stream) => {
      console.log("call.remoteId", call.remoteId)
    });
  }
}
