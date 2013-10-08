class UsersController < ApplicationController

  skip_before_filter :require_login, only:[:update_geolocation]

  def update_geolocation
    cookies[:position] = {value: {latitude: params[:position][:latitude], longitude: params[:position][:longitude]}, expires: 1.hour.from_now}
    respond_to do |format|
      format.all { head :ok, content_type: "text/html" }
    end
  end

end
