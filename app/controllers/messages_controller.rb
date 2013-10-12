class MessagesController < ApplicationController
  before_action :set_message, only: [:show]#, :destroy]
  def index
    @messages = current_user.messages
  end

  def show
  end

  def new
    @message = Message.new(sender_id: current_user.id)
  end

  def create
    @message = Message.new(sender_id: current_user.id)
    @message.update(params_message)
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end

  end


  private
    def set_message
      @message = Message.find(params[:id])
    end

    def params_message
      params.require(:message).permit(:body, receiver_ids:[])
    end
end
