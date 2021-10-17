import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'invitationUrl' ]

  toggleInvitaionUrlModal() {
    document.getElementById('invitation-url-modal').classList.toggle('open-modal')
  }
  copyInvitaionUrl() {
    this.invitationUrlTarget.select()
    document.execCommand('copy')
  }
}
