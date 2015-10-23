$ = require 'jquery'
_ = require 'underscore'
Backbone = require 'backbone'
tc = require 'teacup'

########################################
# Misc Templates
########################################

ace_editor_div = tc.renderable () ->
  tc.div '#ace-editor', style:'position:relative;width:100%;height:40em;'
  
module.exports =
  ace_editor_div: ace_editor_div
