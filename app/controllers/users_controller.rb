class UsersController < ApplicationController

  def update_geolocation
    cookies[:position] = {value: {latitude: params[:position][:latitude], longitude: params[:position][:longitude]}, expires: 1.hour.from_now}
    params[:position].merge!({geocoded: true})
    loc = current_user.geolocation || current_user.build_geolocation
    loc.update(location_params)
    respond_to do |format|
      format.all { head :ok, content_type: "text/html" }
    end
  end


  def discover
    @match = current_user.find_match
  end

  private
    def location_params
      params.require(:position).permit(:latitude, :longitude, :geocoded)
    end
end
