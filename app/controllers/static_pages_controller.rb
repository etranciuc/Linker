class StaticPagesController < ApplicationController
  skip_before_filter :require_login, only:[:index]
  def index
    @location = user_current_location
  end
end
