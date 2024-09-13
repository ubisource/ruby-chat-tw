class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @rooms = Room.all
    @current_room = Room.first
    @new_room = Room.new
    @messages = @current_room.messages if @current_room
    @message = Message.new
  end
end
