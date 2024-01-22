import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  signout () {
    const signoutOption = document.getElementById('signout_option');
    signoutOption.classList.toggle("hidden")
  }
}
