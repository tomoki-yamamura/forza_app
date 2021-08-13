// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"



import * as ActiveStorage from "@rails/activestorage"
import "channels"


//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
//= require moment
//= require fullcalendar
//= require scroll-reveal
//= require_tree .

Rails.start()

ActiveStorage.start()

require('article.js')
require('login.js')
require('calender.js')
require('side.js')
require('fade-up.js')
require('modal.js')

















require("trix")
require("@rails/actiontext")