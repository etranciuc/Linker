# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

window.linker = {}


# Aquire Geolocation at start

# This function is ran if geolocation data is over 1/2 hour old
linker.find_user_geolocation = () ->
  if navigator.geolocation
    # Acquire HTML5 value in acquire_position
    navigator.geolocation.getCurrentPosition(acquire_position, show_error)
  else
    # User does not support HTML5 geolocation feature

# Specific functions for goelocation
# Do nothing
show_error = (error) ->

# Get the actual position
acquire_position = (geo_position) ->
  # Create a custom position object to display map
  position = {
    latitude: geo_position.coords.latitude
    longitude: geo_position.coords.longitude
  }
  send_data(position)
  #display_map(position)

send_data = (position) ->
  options = {
    url: "/update_geolocation"
    type: "get"
    data: position = { position }
  }
  $.ajax(options)


