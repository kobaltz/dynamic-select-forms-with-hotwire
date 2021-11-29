import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mainSelect", "secondarySelect"]
  static values = {
    url: String,
    selected: String
  }

  connect() {
    if (this.selectValue().length > 0) {
      this.fetch()
    }
  }

  change() {
    this.fetch()
  }

  selectValue() {
    return this.mainSelectTarget.selectedOptions[0].value
  }

  fetch() {
    // fetch(`${this.urlValue}?${this.params()}`)
    fetch(`${this.urlValue}?${this.params()}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => Turbo.renderStreamMessage(html))
  }

  params() {
    let params = new URLSearchParams()
    params.append('id', this.selectValue())
    params.append('select', this.secondarySelectTarget.id)
    params.append('selected', this.selectedValue)
    return params
  }
}