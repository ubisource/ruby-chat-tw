class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.find(params[:room_id])
    @messages = @room.messages
    @message = Message.new

    respond_to do |format|
      format.turbo_stream
      format.html { render partial: 'messages/messages', locals: { room: @room, messages: @messages, message: @message } }
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user

    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "messages_room_#{@message.room.id}",
            partial: 'messages/message',
            locals: { message: @message, user: @message.user }
          )
        end
        format.html { redirect_to pages_home_path, notice: 'Message was successfully created.' }
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
