class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.find(params[:room_id])
    @messages = @room.messages
    @message = Message.new

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          'messages',
          partial: 'messages/index',
          locals: { messages: @messages, room: @room, message: @message }
        )
      end
      format.html { render partial: 'messages/messages', locals: { messages: @messages, room: @room, message: @message } }
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to room_path(@room) }
      end
    else
      # Handle error case
      respond_to do |format|
        format.turbo_stream
        format.html { render 'rooms/show' }
      end
    end
  end

  def destroy
    @message.destroy
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
