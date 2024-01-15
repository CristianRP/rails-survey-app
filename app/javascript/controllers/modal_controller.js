import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  close() {
    document.getElementById('modal').style.display = 'none';
  }

  show() {
    document.getElementById('modal').style.display = 'block';
  }
}
