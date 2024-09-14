class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @rooms = Room.all
    @room = Room.new
    @message = Message.new
  end
end
