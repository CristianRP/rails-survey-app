import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  close(event) {
    if ( !event.detail.success ) {
      event.preventDefault();
      return;
    }
    document.getElementById('modal').remove();
    const container = document.getElementsByClassName('w-full')[0];
    const turbo = document.createElement('turbo-frame');
    turbo.setAttribute('id', 'modal');
    container.append(turbo);
  }

  show() {
    document.getElementById('modal').style.display = 'block';
  }
}
