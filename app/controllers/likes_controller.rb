class LikesController < ApplicationController

  def new
  end

  def create
    params[:like].merge!({liker_id: current_user.id})
    @like = Like.new(like_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to discover_path, notice: 'Like was successfully created.' }
        format.json { render action: 'show', status: :created, location: @like }
      else
        format.html { render action: 'new' }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def like_params
      params.require(:like).permit(:liker_id, :likee_id)
    end
end
