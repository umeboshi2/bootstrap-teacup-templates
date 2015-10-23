$ = require 'jquery'
_ = require 'underscore'
Backbone = require 'backbone'
tc = require 'teacup'

########################################
# NavBar Templates
########################################

BootstrapNavBarTemplate = tc.renderable (appmodel) ->
  tc.div '.container', ->
    tc.div '#navbar-brand.navbar-header', ->
      tc.button '.navbar-toggle', type:'button', 'data-toggle':'collapse',
      'data-target':'.navbar-collapse', ->
        tc.span '.sr-only', 'Toggle Navigation'
        tc.span '.icon-bar'
        tc.span '.icon-bar'
        tc.span '.icon-bar'
      tc.a '.navbar-brand', href:appmodel.brand.url, appmodel.brand.name
    tc.div '.navbar-collapse.collapse', ->
      tc.ul '#app-navbar.nav.navbar-nav', ->
        for applet in appmodel.applets
          tc.li appname:applet.appname, ->
            tc.a href:applet.url, applet.name
      tc.ul '#main-menu.nav.navbar-nav.navbar-left'
      tc.ul '#user-menu.nav.navbar-nav.navbar-right'

module.exports =
  BootstrapNavBarTemplate: BootstrapNavBarTemplate
