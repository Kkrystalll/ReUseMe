import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["output"];

  connect() {
    console.log(333);
  }

  close() {
    this.element.remove();
  }
}
