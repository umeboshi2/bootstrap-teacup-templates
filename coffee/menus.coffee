$ = require 'jquery'
_ = require 'underscore'

tc = require 'teacup'

# Main Templates must use teacup.
# The template must be a teacup.renderable, 
# and accept a layout model as an argument.

########################################
# Templates
########################################
user_menu = tc.renderable (user) ->
  name = user.username
  tc.ul '#user-menu.ctx-menu.nav.navbar-nav', ->
    tc.li '.dropdown', ->
      tc.a '.dropdown-toggle', 'data-toggle':'dropdown', ->
        if name == undefined
          tc.text "Guest"
        else
          tc.text name
        tc.b '.caret'
      tc.ul '.dropdown-menu', ->
        if name == undefined
          tc.li ->
            tc.a href:'/login', 'login'
        else
          tc.li ->
            tc.a href:'/app/user', 'User Page'
          # we need a "get user info" from server
          # to populate this menu with 'admin' link
          # FIXME use "?." to help here
          admin = false
          unless name == undefined
            groups = user.groups
            if groups != undefined
              for g in groups
                if g.name == 'admin'
                  admin = true
          if admin
            tc.li ->
              href = '/admin'
              pathname = window.location.pathname
              if pathname.split(href)[0] == ''
                href = '#'
              tc.a href:href, 'Administer Site'
          tc.li ->
            tc.a href:'/logout', 'Logout'

main_sidebar = tc.renderable (model) ->
  tc.div '.btn-group-vertical', ->
    for entry in model.entries
      tc.div '.btn.btn-default.sidebar-entry-button', 'button-url':entry.url, ->
        tc.text entry.name          


########################################
module.exports =
  user_menu: user_menu
  main_sidebar: main_sidebar
