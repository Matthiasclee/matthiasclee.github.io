// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "trix"
import "@rails/actiontext"
import "@fortawesome/fontawesome-free/css/all"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

function copyToClipboard(id) {
  var copyText = document.getElementById(id);
  navigator.clipboard.writeText(copyText.innerHTML.replace('&lt;', '<').replace('&gt;', '>').replace('&lt;', '<').replace('&gt;', '>'));
}
window.copyToClipboard = copyToClipboard
