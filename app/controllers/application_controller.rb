class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :require_login



  protected

    # This methods get either geolocation information
    # if the user has a cookie. Otherwise, it tries to
    # get the information from ip data
    def user_current_location
      if cookies[:position]
        # If cookies are set, use information from cookie
        location = Location.new(eval(cookies[:position]))
      else
        # For an HTTP request do the following
        # If no cookies, try to aquire location from ip
        location = Location.new(latitude: 46.1983922, longitude: 6.142296099999999)# Geneva
      end
      return location
    end


end
