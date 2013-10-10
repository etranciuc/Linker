class StaticPagesController < ApplicationController
  skip_before_filter :require_login, only:[:index]
  def location
    @location = user_current_location
  end
end
