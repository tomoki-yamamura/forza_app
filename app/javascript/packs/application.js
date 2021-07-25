// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"

import * as ActiveStorage from "@rails/activestorage"
import "channels"


//= require jquery
//= require jquery_ujs
//= require moment
//= require fullcalendar
//= require_tree .

Rails.start()

ActiveStorage.start()

require('article.js')
require('login.js')
require('page_top.js')
require('calender.js')
require('side.js')











