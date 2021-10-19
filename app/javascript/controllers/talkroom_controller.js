import { Controller } from '@hotwired/stimulus'
import fabricjs from 'fabricjs'

export default class extends Controller {
  connect() {
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
  }
}
