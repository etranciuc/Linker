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


  def create
    params[:location].merge!({geocoded: false})

    location = current_user.locations.build(new_locations_params)
    respond_to do |format|
      if location.save
        format.html { redirect_to locations_path, notice: 'Location was successfully created.' }
        format.json { render action: 'index', status: :created, location: location }
      else
        format.html { render action: 'index' }
        format.json { render json: location.errors, status: :unprocessable_entity }
      end

    end
  end

  def index
    @locations = current_user.locations
  end

  private

    def new_locations_params
      params.require(:location).permit(:latitude, :longitude, :geocoded, :address)
    end
    def location_params
      params.require(:position).permit(:latitude, :longitude, :geocoded)
    end

end
