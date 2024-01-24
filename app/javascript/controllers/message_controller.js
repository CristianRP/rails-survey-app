import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  show () {
    document.getElementById('answers_submitted').classList.toggle('hidden')
  }

  remove () {
    document.getElementById('answers_submitted').classList.toggle('hidden')
  }

}
