class StaticPagesController < ApplicationController
  skip_before_filter :require_login, only:[:index]

  def location
    @location = current_user.geolocation
  end
end
