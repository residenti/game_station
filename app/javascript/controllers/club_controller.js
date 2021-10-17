import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  toggleInvitaionUrlModal() {
    document.getElementById('invitation-url-modal').classList.toggle('open-modal')
  }
}
