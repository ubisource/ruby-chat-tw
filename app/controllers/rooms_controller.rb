class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
    @current_room = Room.first
    @messages = @current_room.messages if @current_room
    @message = Message.new
  end

  def show
    @rooms = Room.all
    @current_room = Room.find params[:id]
    @messages = @current_room.messages
    @message = Message.new
    respond_to do |format|
      format.turbo_stream
      format.html { render :index }
    end
  end
end
