class LocationsController < ApplicationController

  def geolocation
    cookies[:position] = {value: {latitude: params[:position][:latitude], longitude: params[:position][:longitude]}, expires: 1.hour.from_now}
    params[:position].merge!({geocoded: true})
    @location = current_user.geolocation || current_user.build_geolocation
    @location.update(location_params)
    render json: @location.to_json
  end

  def location
  end

  private
    def location_params
      params.require(:position).permit(:latitude, :longitude, :geocoded)
    end

end
